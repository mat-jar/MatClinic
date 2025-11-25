Rails.application.routes.draw do
  resources :appointments
  resources :doctors
  resources :patients

  root "patients#index"
end
