Rails.application.routes.draw do
  resources :transactions
  root "transactions#index"
end