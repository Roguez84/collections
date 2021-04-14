class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :invoice,  optional: true

  def add_invoice_to_appointment(appointment_id, invoice_id="New Invoice")
    appointment = Appointment.find_by(id: appointment_id)

    if ((invoice_id == "New Invoice") && appointment)
      new_invoice = Invoice.create()
      invoice_id = new_invoice.id
    end

    if appointment
      appointment.update(invoice_id: invoice_id)
    end
  return appointment
  end

  def self.para_grafico
    find_by_sql("
       SELECT DISTINCT(DATE_TRUNC('month',date_time)) AS  production_to_month, COUNT(DATE_TRUNC('month',date_time))
       FROM appointments 
       GROUP BY DATE_TRUNC('month',date_time)")
       .pluck(:production_to_month,:count)
  end
end
