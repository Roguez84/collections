class ApplicationController < ActionController::Base

  def current_invoice

    if current_doctor
        appointments_de_doctor = Appointment.where(doctor_id: current_doctor.id, invoice_id: !nil)
        last_created_invoice = appointments_de_doctor.last.invoice_id
        invoice = Invoice.where(invoice_id: last_created_invoice)

        if invoice.nil?
          invoice = Invoice.create(state: "created")
        end
        return invoice
        nil
    end
  end
end
