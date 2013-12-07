GpsTracking::Application.routes.draw do

  resources :stations

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