MusicApp::Application.routes.draw do
 
  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  root to: 'tracks#index'
  resources :users
  resources :sessions
  resources :tracks do
    resources :comments do
      post "flags", to: 'flags#create', as: 'flag'
    end
  
  end

end

   

