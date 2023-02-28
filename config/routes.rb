Rails.application.routes.draw do
  root 'home#index'

  #session
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #users
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, except: [:new, :create]

  #blogs
  resources :blogs

  #comments
  post 'blog/comment/:id', to: 'comments#create', as: 'blog/comment/'

end
