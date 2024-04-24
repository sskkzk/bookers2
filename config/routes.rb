Rails.application.routes.draw do
  devise_for :users  # ユーザー認証のためのルーティングを生成

  # ユーザー関連のルーティング (indexとshowのみ許可)
  resources :users, only: [:show, :index] 
  
  # トップページのルーティング
  root to: 'homes#top'

  # ブック関連のルーティング (new, index, showのみ許可)
  resources :books, only: [:new, :index, :show]

  # aboutページのルーティング
  get 'homes/about', to: 'homes#about'  # こちらもインデントに注意
end
