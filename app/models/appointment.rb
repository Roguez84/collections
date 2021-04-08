class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
#  belongs_to :invoice ##Taking this out to not make it mandatory for an invoice to exist in order to create an appointment
end
