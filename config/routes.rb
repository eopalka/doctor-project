Rails.application.routes.draw do

  root to: 'doctors#welcome'
  resources :patients
  resources :appointments
  resources :doctors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
