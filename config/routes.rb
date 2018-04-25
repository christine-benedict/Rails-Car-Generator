Rails.application.routes.draw do
  get 'cars/create'
  get 'cars/status'
  get 'cars/accelerate'
  get 'cars/brake'
  get 'cars/lightstoggle'
  get 'cars/parkingbraketoggle'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
