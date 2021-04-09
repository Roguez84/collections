Rails.application.routes.draw do
  #devise_for :doctors
  get 'appointments/index'
  get 'appointment/index'
  root 'appointments#index'
  devise_for :doctors, controllers: {
        sessions: 'doctors/sessions', registrations: 'doctors/registrations'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
