Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'homes#index'

  resources :employees
  resources :departments
  get '/employees_of_departments', to: "departments#employees" 
  #resources :leaves

  resources :leaves do
    member do
      get :confirm_email
    end
  end
end
