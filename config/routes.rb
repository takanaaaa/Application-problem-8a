Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] do
    post 'follow/:id' => 'relationships#create', as: "follow"
    delete 'unfollow/:id' => 'relationships#destroy', as: "unfollow"
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

end