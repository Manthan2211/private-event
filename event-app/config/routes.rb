Rails.application.routes.draw do
  get 'sessions/new'

  root 'pages#home'
  get 'pages/home'
  get 'pages/help'
  get 'pages/about'

  get    '/login',to: 'sessions#new'
  post   '/login',to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :events
  resources :users
  resources :invitations,only: [:create, :destroy]
    
  get    '/signup',to: 'users#new'
  post   '/signup',to: 'users#create'
  get '*path' => redirect('/') 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
