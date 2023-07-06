Rails.application.routes.draw do

  resources :posts

  devise_for :users

  post 'signup', to: 'users#signup'
  post 'login', to: 'users#login'

end
