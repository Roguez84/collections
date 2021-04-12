class DoctorsController < ApplicationController
  before_action :authenticate_doctor!, except: [:index]
#  before_action :set_doctor, only: %i[ show edit update destroy ]
  before_action :set_doctor, only: %i[update]


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
