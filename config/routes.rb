Rails.application.routes.draw do
  get 'commercial/commercialpage'
  get 'residential/residentialpage'

  get 'greetings/hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'residential#residentialpage'
end
