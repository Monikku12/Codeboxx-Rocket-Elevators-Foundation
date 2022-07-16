Rails.application.routes.draw do
 
 
  resources :quotes
  resources :employee_lists
  resources :building_details
  resources :elevators
  resources :batteries
  resources :columns
  resources :buildings
  resources :customers
  resources :addresses
  resources :leads
  resources :messages
  resources :googlemaps

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get '/test', to: 'messages#patate'
  get 'termsAndConditions', to: 'index#termsAndConditions', as: "termsAndConditions"
  get 'privacy', to: 'index#privacy', as: "privacy"
  get 'commercial', to: 'index#commercialpage', as: "commercial"
  get 'residential', to: 'index#residentialpage', as: "residential"
  get 'index', to: 'index#index'
  post 'lead', to: 'leads#create', as: "leadcreate"
  get 'googlemap', to: 'googlemaps#index', as: "maps"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'index#index'

end
