class HomeController < ApplicationController


  def index

   if current_doctor
     redirect_to doctors_index_path
#    elsif current_patient
#      redirect_to patients_index_path
   end
  end

end
