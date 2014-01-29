GpsTracking::Application.routes.draw do

  resources :traffic_jams

  get "stations/map/:id", to: "stations#show_maps", as: "maps_station"
  get "data/data_stations" => "home#data_stations"
  get "data/data_current", to: "home#current_station", as:"current"
  get "data/color_station/:id", to: "home#color_station"

  get "stations/json/:id", to: "stations#show_json", as: "stations_json"

  resources :traffic_jams
  resources :list_stations
  resources :stations
  resources :car_styles
  resources :cars
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  scope 'api', defaults: {format: 'json'} do
    scope 'track' do
      resources :trackings
      get "next_station", to: "trackings#next_station"
      get "show_route", to: "trackings#show_route"
      get "current_select/:id", to: "home#total_time_current_to_select"
    end
  end
end