class PatientsController < ApplicationController
  before_action :authenticate_patient!, except: [:index]
  before_action :set_patient, only: %i[update]

  def index
    if current_patient
       @appointments = current_patient.appointments.order(:date_time)
     end

  end

  def profile
    @patient = current_patient
    @boletas = current_patient.invoices
  end


  def update
    respond_to do |format|
      if @patient.update(patient_params)
        #format.html { redirect_to @doctor, notice: "Doctor was successfully updated." }
        format.html { redirect_to patients_profile_path, notice: "Patient was successfully updated." }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_patient
    @patient = Patient.find(params[:patient][:id])
  end

  # Only allow a list of trusted parameters through.
  def patient_params
    params.require(:patient).permit(:id, :RUT, :names, :surnames, :address, :email)
  end



end
