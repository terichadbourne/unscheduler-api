# frozen_string_literal: true

Rails.application.routes.draw do

  resources :events, only: %i[index show update]
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update]
  resources :discussions, except: %i[new edit]
  resources :votes, except: %i[new edit update]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
end
