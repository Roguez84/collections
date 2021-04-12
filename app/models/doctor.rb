class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :appointments
  has_many :invoices, through: :appointments
  has_many :patients, through: :appointments
  def self.from_omniauth(access_token)
    data = access_token.info
    doctor = Doctor.where(email: data.email).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless doctor
        doctor = Doctor.create(names: data.name,
            RUT: "9999-k",
           email: data.email,
           password: Devise.friendly_token[0,20]
        )
    end
    doctor
  end
end
