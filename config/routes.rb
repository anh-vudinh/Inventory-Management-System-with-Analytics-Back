Rails.application.routes.draw do
  namespace :api do
    resources :sessions
    resources :companies
    
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

    delete '/logout', to: 'sessions#destroy'
    post "/login", to: "sessions#login"
    get "/auto_login", to: "sessions#auto_login"
    get "/auth", to: "users#show"
    get "/get_children/:id", to: "companies#get_children"
    get "/get_parents", to: "companies#get_parents"
    post "/create_company", to: "companies#create"
    get "/get_employees/:id", to: "employees#get_employees"
    get "/employees/:company_id/:id", to: "employees#show"
    patch "/transfer_employee", to: "employees#transfer_employee"
    post "/duplicate_employee", to: "employees#duplicate_employee"
  end
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
