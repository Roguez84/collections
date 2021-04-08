class AppointmentsController < ApplicationController
  def index
    @doctors = Doctor.all
    @patients = Patient.all
    @appointments = Appointment.all
    # @appointments = Appointment.find_by_sql([
    #     "SELECT *
    #     FROM appointments
    #     WHERE id = ?",
    #     1
    #   ])
    @invoices = Invoice.all
  end
end
