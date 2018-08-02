Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :nodes, only: [:update]
      resources :branches, only: [:update]
    end
  end

  # landing page
  get '/login', to: 'home#login'

  # create session with posting the credentials
  post '/session', to: 'home#create'

  root to: 'home#show'

end
