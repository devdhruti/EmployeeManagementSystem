Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'

  resources :employees
  resources :departments
  get '/employees_of_departments', to: "departments#employees" 
end
