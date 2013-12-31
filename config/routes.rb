GpsTracking::Application.routes.draw do

  resources :stations
  get "stations/map/:id", to: "stations#show_maps", as: "maps_station"
  get "data/data_stations" => "home#data_stations"
  get "data/data_current", to: "home#current_station", as:"current"
  get "data/color_station/:id", to: "home#color_station"
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