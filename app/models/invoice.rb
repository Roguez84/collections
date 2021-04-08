class Invoice < ApplicationRecord
  has_many :appointments
  has_one :doctor, through: :appointments
  has_one :patient, through: :appointments
end
