Rails.application.routes.draw do
  devise_for :users
  get 'commercial/commercialpage'
  get 'residential/residentialpage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'index#index'
end
