Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :books, only: [:new, :index, :show]
  get 'homes/about' => 'homes#about'
end
