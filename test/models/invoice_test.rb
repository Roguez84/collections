require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'creates a random number on create' do
    #patient = Patient.create( email: "patient@example.com" , password: "123456", RUT:"999-k" )
    #doctor = Doctor.create( email: "doctor@example.com" , password: "123456", RUT:"888-k" )
    #appointment = Appointment.create(doctor_id: doctor.id, patient_id: patient.id)
    invoice = Invoice.create()
    assert !invoice.invoice_num.nil?
  end

  test 'invoice_num must be unique' do
    invoice = Invoice.create()
    duplicated_order = invoice.dup
    assert_not duplicated_order.valid?
  end

end

#Original de las lecturas
# test 'creates a random number on create' do
#   user = User.create( email: "user@example.com" , password: "12345678" )
#   order = Order.create( user_id: user.id)
#   assert !order.number. nil ?
# end
