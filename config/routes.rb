Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

##Patients
  get 'patients/index'
  get 'patients/profile'

##Doctors
  get 'doctors/index'
  get 'doctors/profile'
  post 'doctors/update'

##Appointments
  get 'appointments/index'
  resource :appointment, only: [ :show , :update ]

## Invoices
resource :invoice , only: [ :show , :update ]


## Cart
resource :cart , only: [ :show , :update ]


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #devise_for :doctors
  #devise_for :patients
  devise_for :doctors, controllers: {
        sessions: 'doctors/sessions', registrations: 'doctors/registrations', omniauth_callbacks: 'doctors/omniauth_callbacks'
      }
  #devise_for :doctors, controllers: { omniauth_callbacks: 'doctors/omniauth_callbacks' }
  devise_for :patients, controllers: {
        sessions: 'patients/sessions', registrations: 'patients/registrations'
      }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
