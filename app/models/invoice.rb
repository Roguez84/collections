class Invoice < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments#La verdad es que deberia ser belongs_to_many si esto exisistiera
  has_many :patients, through: :appointments#La verdad es que deberia ser belongs_to_many si esto exisistiera
end
