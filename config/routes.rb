# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
  post 'sign_up', to: 'users#create'
  get 'sign_up', to: 'users#new'
end
