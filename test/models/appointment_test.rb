require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'add invoice to appointment' do
      invoice = Invoice.create()
      patient = Patient.create( email: "patient@example.com" , password: "123456", RUT:"999-k" )
      doctor = Doctor.create( email: "doctor@example.com" , password: "123456", RUT:"888-k" )
      appointment = Appointment.create(doctor_id: doctor.id,
                                       patient_id: patient.id,
                                       date_time: Faker::Time.between_dates(from: Date.today - 60, to: Date.today +  30, period: :day) )

      #puts(Appointment.find_by(id: appointment.id))
      #puts(appointment.update(invoice_id: invoice.id))
      appointment = appointment.add_invoice_to_appointment(appointment.id, invoice.id)

      assert_equal invoice.id, appointment.invoice_id
      #assert_equal appointment, true

  end

end
