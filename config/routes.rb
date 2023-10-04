Rails.application.routes.draw do
  root "orders#new"

  resources :orders, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    get 'calculate_dishes_to_prepare', to: 'orders#calculate_dishes_to_prepare'
  end
end
