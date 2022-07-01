Rails.application.routes.draw do
  
  get 'commercial', to: 'commercial#commercialpage', as:'commercial'
  get 'residential', to: 'residential#residentialpage', as:'residential'
  get 'index', to: 'index#index', as:'index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'index#index'

  resources :quotes

  
end

