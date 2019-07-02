Rails.application.routes.draw do
  namespace :api do
    get '/messages' => 'messages#index'
    post '/messages' => 'messages#create'

    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'
  end
end
