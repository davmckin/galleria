Rails.application.routes.draw do

  resources :users do
    resources :albums do
      resources :photos
    end
  end

  root 'albums#index'

  get "/login" => 'session#new', as: :login
 post "/login" => 'session#create'
 delete "/logout" => 'session#destroy', as: :logout
 get '/about' => 'albums#about', as: :about

end
