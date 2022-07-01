Rails.application.routes.draw do
  devise_for :users
  get 'commercial', to: 'index#commercialpage', as: "commercial"
  get 'residential', to: 'index#residentialpage', as: "residential"
  get 'index', to: 'index#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'index#index'

  resources :quotes

  
end

