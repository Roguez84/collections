class Invoice < ApplicationRecord
  before_create :generate_number
  validates :invoice_num, uniqueness: true

  has_many :appointments
  has_many :doctors, through: :appointments#La verdad es que deberia ser belongs_to_many si esto exisistiera
  has_many :patients, through: :appointments#La verdad es que deberia ser belongs_to_many si esto exisistiera

  #Logica para asegurarse que no cree 2 numeros de boleta iguales
  def generate_number
    self.invoice_num ||= loop do
      random = "BO #{Array.new( 9 ){rand( 9 )} .join}"
      break random unless Invoice.find_by(invoice_num: random)
    end
  end

end
