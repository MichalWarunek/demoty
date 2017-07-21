Rails.application.routes.draw do
  devise_for :users , :controllers => {:sessions => "sessions"} 
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'posts/poczekalnia'
  get 'posts/top'
  get 'posts/losowy'
  get 'footer/polityka'
  get 'footer/regulamin'
  get 'footer/kontakt'
  get 'users/ranking'
  

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash


  resources :favorite_posts, only: [:create, :destroy]


  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  

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
