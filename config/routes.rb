Rails.application.routes.draw do
  #devise_for :doctors
  #devise_for :patients
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'patients/index'
  get 'doctors/index'
  get 'home/index'
  get 'appointments/index'
  root 'home#index'
  devise_for :doctors, controllers: {
        sessions: 'doctors/sessions', registrations: 'doctors/registrations'
      }
  devise_for :patients, controllers: {
        sessions: 'patients/sessions', registrations: 'patients/registrations'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
