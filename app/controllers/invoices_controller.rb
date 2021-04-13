class InvoicesController < ApplicationController
  before_action :authenticate_doctor!


  def update
    #invoice = params[:cart][:appointment_id]
    appointment = Appointment.where(id: params[:invoice][:appointment_id])
    appointment_to_add = params[:invoice][:appointment_id]
    invoice_to_add_appointment_to = params[:invoice][:invoice_id]

    appointment.add_invoice_to_appointment(appointment_to_add,invoice_to_add_appointment_to)

    redirect_to doctors_index_path, notice: "Invoice added successfuly"
  end

  # def show
  #   @invoice = current_invoice
  # end

end
