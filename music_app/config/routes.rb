MusicApp::Application.routes.draw do
 
  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  get 'logout', to: 'sessions#destroy', as: 'logout'
  
   root to: 'users#index'
   resources :users
   resources :sessions
   resources :tracks do
     resources :comments
   end
   

   
end
