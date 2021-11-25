Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searches#search'
  resources :users,only: [:show,:index,:edit,:update] do
    post 'follow/:id' => 'relationships#create', as: 'follow'
    delete 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :messages, only: [:show, :create]

end