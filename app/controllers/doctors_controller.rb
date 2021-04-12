class DoctorsController < ApplicationController
  before_action :authenticate_doctor!, except: [:index]

  def index
    if current_doctor
       @appointments = current_doctor.appointments.order(:date_time)
     end
  end

  def profile
    @doctor = current_doctor
    @boletas = current_doctor.invoices
  end

end
