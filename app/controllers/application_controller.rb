class ApplicationController < ActionController::Base

  def current_invoice
    if current_doctor
      if params[:appointment][:invoice_id].length > 0
        # appointments_de_doctor = Appointment.where(doctor_id: current_doctor.id, invoice_id: params[:appointment][:invoice_id])
        # last_created_invoice = appointments_de_doctor.last.invoice_id
        #invoice = Invoice.where(invoice_id: last_created_invoice)
        invoice = Invoice.find(params[:appointment][:invoice_id])

      else
          #invoice = Invoice.create(state: "created")
        invoice = Invoice.create()
      end
      return invoice
      #nil
    end
  end
end
