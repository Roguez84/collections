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


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #devise_for :doctors
  #devise_for :patients
  devise_for :doctors, controllers: {
        sessions: 'doctors/sessions', registrations: 'doctors/registrations'
      }
  devise_for :patients, controllers: {
        sessions: 'patients/sessions', registrations: 'patients/registrations'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
