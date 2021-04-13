class AppointmentsController < ApplicationController
  def index
    @doctors = Doctor.all
    @patients = Patient.all
    @appointments = Appointment.all
    @appointments = Appointment.find_by_sql([
        "SELECT *
        FROM appointments
        WHERE invoice_id = ?",
        1
      ])
    @invoices = Invoice.all
    Invoice.find_by_sql([
        "SELECT *
        FROM invoices
        WHERE id = ?",
        1
      ])

  end

  # def update
  #
  #   #appointment = params[:appointment][:appointment_id, :invoice_id]
  #   #add_invoice_to_appointment(appointment_id, invoice_id)
  #   current_invoice.add_invoice_to_appointment(params[:appointment][:appointment_id, :invoice_id)
  #   redirect_to doctors_index_path, notice: "successfuly added to invoice #{:invoice_id}"
  # end

  # def show
  #   @invoice = current_invoice
  # end



end
