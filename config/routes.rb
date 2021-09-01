Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users

  resources :counters

  get '*path', to: 'pages#home', via: :all

end
