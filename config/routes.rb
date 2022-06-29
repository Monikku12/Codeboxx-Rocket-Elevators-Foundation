Rails.application.routes.draw do
  
  get 'index/index'
  get 'greetings/hello/preview', to: 'greetings#preview', as:""
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'index#index'

  
end

