Rails.application.routes.draw do

  resources :users
  resources :albums do
    resources :photos
  end




  root 'albums#index'

  get "/login" => 'session#new', as: :login
 post "/login" => 'session#create'
 delete "/logout" => 'session#destroy', as: :logout
 get '/about' => 'albums#about', as: :about

end
