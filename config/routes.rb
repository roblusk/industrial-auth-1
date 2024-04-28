Rails.application.routes.draw do
  root "users#feed"

  devise_for :users
  
  #available subroutes: index, show, new, edit, create, update, & destroy
  resources :comments
  resources :follow_requests, except: [:index, :show, :new, :edit]
  resources :likes, only: [:create, :destroy]
  resources :photos, except: [:index]

  get ":username" => "users#show", as: :user
  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/discover" => "users#discover", as: :discover
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
end
