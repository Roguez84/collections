class DoctorsController < ApplicationController
  before_action :authenticate_doctor!, except: [:index, :probar]
#  before_action :set_doctor, only: %i[ show edit update destroy ]
  before_action :set_doctor, only: %i[update]

  def probar
    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new ENV['MAILGUN_PRIMER_API_KEY']

    # Define your message parameters
    message_params =  { from: 'bob@sending_domain.com',
                        to:   't.roguez984@gmail.com',
                        subject: 'The Ruby SDK is awesome!',
                        text:    'It is really easy to send a message!'
                      }

    # Send your message through the client
    #mg_client.send_message 'sending_domain.com', message_params
    mg_client.send_message 'sandboxe9f3368fa07f4697a08bd4c854002957.mailgun.org', message_params
    redirect_to root_path
  end


  def index
    if current_doctor
       @appointments = current_doctor.appointments.order(:date_time)
     end
  end

  def profile
    @doctor = current_doctor
    @boletas = current_doctor.invoices
  end

  # PATCH/PUT /doctors/1 or /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        #format.html { redirect_to @doctor, notice: "Doctor was successfully updated." }
        format.html { redirect_to doctors_profile_path, notice: "Doctor was successfully updated." }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def doctor_params
    params.require(:doctor).permit(:id, :RUT, :names, :surnames, :specialty, :email)
  end

end
