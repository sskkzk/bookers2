Rails.application.routes.draw do
  devise_for :users # ユーザー認証のためのルーティングを生成
  
  resources :books

  resources :users, only: [:show, :edit, :index, :update]
  
  # トップページのルーティング
  root to: 'homes#top'

  # aboutページのルーティング
  get 'home/about', to: 'homes#about'  # こちらもインデントに注意
end
