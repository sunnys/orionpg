Rails.application.routes.draw do
  resources :reporting_structures
  resources :my_accounts
  resources :transaction_details
  resources :transactions
  resources :tokens
  resources :employees
  resources :third_party_employees
  resources :third_party_vendors
  resources :accounts
  resources :companies
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
