class CartsController < ApplicationController
  before_action :authenticate_doctor!
  #### WAIT A MINUTE!! CART DOESNT APPLY TO DOCTOR

  def update
    invoice = params[:cart][:appointment_id]

    current_invoice.add_invoice_to_appointment(appointment)

    redirect_to doctors_index_path, notice: "Invoice added successfuly"
  end

  def show
    @invoice = current_invoice
  end
end
