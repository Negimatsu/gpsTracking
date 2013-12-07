GpsTracking::Application.routes.draw do

  resources :stations
  get "stations/map/:id", to: "stations#show_maps", as: "maps_station"
  get "maps"=> "stations#maps"
  resources :locations

  resources :car_styles
  resources :cars
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :trackings


  scope 'api', defaults: {format: 'json'} do
    scope 'track' do
      resources :trackings
    end
  end
end