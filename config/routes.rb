Rails.application.routes.draw do
  
  resources :sessions
  resources :employee_users
  resources :users
  resources :company_employees
  resources :employees
  resources :applicants
  resources :role_role_resources
  resources :role_role_requirements
  resources :company_roles
  resources :role_resources
  resources :role_requirements
  resources :roles
  resources :companies
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
