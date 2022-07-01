Rails.application.routes.draw do
  
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get 'commercial', to: 'index#commercialpage', as: "commercial"
  get 'residential', to: 'index#residentialpage', as: "residential"
  get 'index', to: 'index#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'index#index'

  resources :quotes
  resources :employee_lists
  
end

