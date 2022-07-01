Rails.application.routes.draw do
  
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'commercial', to: 'commercial#commercialpage', as:'commercial'
  get 'residential', to: 'residential#residentialpage', as:'residential'
  get 'index', to: 'index#index', as:'index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'index#index'

  resources :quotes
  resources :employee_lists
  
end

