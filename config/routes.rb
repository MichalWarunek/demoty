Rails.application.routes.draw do
  devise_for :users 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'posts/poczekalnia'
  get 'posts/top'
  get 'posts/losowy'
  

  resources :users, only: [:show, :edit, :update] 
  resources :posts do

  	member do
  		put "like" => "posts#upvote"
  		put "unlike" => "posts#downvote"
end
end
  resources :posts do
  		 resources :comments
  end

  resources :comments do

    member do
      put "like" => "comments#upvote"
      put "unlike" => "comments#downvote"
end
end

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
