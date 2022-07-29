Rails.application.routes.draw do
  
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
  resources :interventions
  
  get '/test', to: 'messages#patate'
  get 'termsAndConditions', to: 'index#termsAndConditions', as: "termsAndConditions"
  get 'privacy', to: 'index#privacy', as: "privacy"
  get 'commercial', to: 'index#commercialpage', as: "commercial"
  get 'residential', to: 'index#residentialpage', as: "residential"
  get 'index', to: 'index#index'
  post 'lead', to: 'leads#create', as: "leadcreate"
  get 'googlemap', to: 'googlemaps#index', as: "maps"
  get 'get_buildings_by_customer/:customer_id', to: 'buildings#get_buildings_by_customer'
  get 'get_batteries_by_building/:building_id', to: 'batteries#get_batteries_by_building'
  get 'get_columns_by_battery/:battery_id', to: 'columns#get_columns_by_battery'
  get 'get_elevators_by_column/:column_id', to: 'elevators#get_elevators_by_column'
  get '/building_search' => 'buildings#building_search'
  get '/battery_search' => 'batteries#battery_search'
  get '/column_search' => 'columns#column_search'
  get '/elevator_search' => 'elevators#elevator_search'
  delete 'logout', to: 'sessions#destroy'

end
