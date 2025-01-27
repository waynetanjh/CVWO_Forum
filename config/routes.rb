Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'posts#index'

  # to create new path 
  # get 'about', to: 'pages#about'
  
  resources :users, except: [:destroy]
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'

  resources :posts

  resources :users, only: [:show] do
    resources :posts, only: [:index, :show]
  end

  Rails.application.routes.draw do
    resources :posts do
      member do
        post :like
      end
    end
  end

  # to update likes 
  resources :posts do
    member do
      post :like
    end
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
