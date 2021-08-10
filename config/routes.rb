Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'backgrounds#show'
      resources :breweries, only: :index
      resources :users, only: :create
      resources :sessions, only: :create
      resources :road_trip, only: :create
    end
  end
end
