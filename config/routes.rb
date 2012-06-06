Sabertooth::Application.routes.draw do
  resources :routines

  resources :assets

  resources :items

  #root :to => "devise/session#new"

  devise_for :users
  root :to => 'home#index'

  #authenticated :user do
  #  root :to => 'home#index'
  #end
  ##root :to => "sessions#new"
  #
  #unauthenticated :user do
  #  #root :to => redirect("/users/sign_in")
  #  root :to => 'home#index2'
  #  #root :to => 'user_session#new'
  #end

  #match 'foo/bar' => {:controller=>"devise/sessions", :action=>"new"}
  #match 'devise/' => "devise/sessions#new"

  resources :users, :only => [:show, :index]
end
