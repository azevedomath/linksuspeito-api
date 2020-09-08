Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do 
    namespace :v1 do 
      resources :urls
    end
  end
  get '/go/:url', to: 'server#move'
  get '/get_key', to: 'server#get_new_key'
  post '/credentials', to: 'users#create_credentials'
  root 'home#index'
end
