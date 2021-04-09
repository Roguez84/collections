class PatientsController < ApplicationController
  def index
  end

  def profile
    before_action :authenticate_user!
    @patient = current_patient
  end

end
