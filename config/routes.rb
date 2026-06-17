Rails.application.routes.draw do
  devise_for :users
  resources :transactions
  root "transactions#index"
end