Rails.application.routes.draw do
  
  resources :interventions
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root to: 'index#index'
  
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

  get '/test', to: 'messages#patate'
  get 'termsAndConditions', to: 'index#termsAndConditions', as: "termsAndConditions"
  get 'privacy', to: 'index#privacy', as: "privacy"
  get 'commercial', to: 'index#commercialpage', as: "commercial"
  get 'residential', to: 'index#residentialpage', as: "residential"
  get 'index', to: 'index#index'
  post 'lead', to: 'leads#create', as: "leadcreate"
  get 'googlemap', to: 'googlemaps#index', as: "maps"
  get 'get_buildings_by_customer/:customer_id', to: 'buildings#get_buildings_by_customer'
  get '/buildings_search' => 'buildings#buildings_search'
end
