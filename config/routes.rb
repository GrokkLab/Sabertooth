Sabertooth::Application.routes.draw do
  resources :routines

  resources :assets

  resources :items

  devise_for :users

  authenticated :user do
    root :to => 'home#index'
  end

  unauthenticated :user do
    root :to => redirect("/users/sign_in")
  end

  resources :users, :only => [:show, :index]
end
