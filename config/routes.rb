Rails.application.routes.draw do
  get 'statistics/show'
  resources :appointments, except: :show
  resources :doctors
  resources :patients

  root "patients#index"
end
