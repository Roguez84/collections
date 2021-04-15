class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :appointments
  has_many :invoices, through: :appointments
  has_many :doctors, through: :appointments

  def self.from_omniauth(access_token)
    data = access_token.info
    patient = Patient.where(email: data.email).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless patient
        patient = Patient.create(names: data.name,
          RUT: "8888-k",
          email: data.email,
          password: Devise.friendly_token[0,20]
        )
    end
    patient
  end



end
