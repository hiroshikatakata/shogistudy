# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'boards#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :boards do
    resources :responses
  end
end
