Rails.application.routes.draw do
  resource :account_merges, only: [ :new, :create ]
  resources :accounts

  root 'accounts#index'
end
