Rails.application.routes.draw do
  root "orders#new"

  resources :orders, only: [:new, :create]
end
