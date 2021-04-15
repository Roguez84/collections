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

  def update

    #appointment = params[:appointment][:appointment_id, :invoice_id]
    #add_invoice_to_appointment(appointment_id, invoice_id)
    invoice = current_invoice
    current_appointment = Appointment.find(params[:appointment][:appointment_id])
    current_appointment.add_invoice_to_appointment(params[:appointment][:appointment_id] , invoice.id)
    # redirect_to doctors_index_path, notice: "successfuly added to invoice #{:invoice_id}"
    redirect_to doctors_index_path, notice: "el invoice id es #{invoice.id}"
  end

  # def show
  #   @invoice = current_invoice
  # end



end
