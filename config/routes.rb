Rails.application.routes.draw do
  resources :bookings, only: [:new, :create, :show]

  root 'flights#index'
end
