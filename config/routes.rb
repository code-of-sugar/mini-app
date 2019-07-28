Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, only: [:index, :new, :create, :show, :edit, :destroy, :update] do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:edit, :index, :update]
end