class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :invoice,  optional: true
end
