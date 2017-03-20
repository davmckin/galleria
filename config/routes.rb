Rails.application.routes.draw do

  resources :users do
    resources :albums do
      resources :photos
    end
  end

  root 'albums#index'

  get "/login" => 'sessions#new', as: :login
 post "/login" => 'sessions#create'
 delete "/logout" => 'sessions#destroy', as: :logout
 get '/marketing' => 'albums#marketing', as: :marketing

end
