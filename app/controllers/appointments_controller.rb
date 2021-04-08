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
end
