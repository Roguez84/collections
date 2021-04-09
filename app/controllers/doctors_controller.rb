class DoctorsController < ApplicationController


  def index
    if current_doctor
       @appointments = current_doctor.appointments.order(:date_time)
     end
  end
end
