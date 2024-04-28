Rails.application.routes.draw do
  devise_for :users  # ユーザー認証のためのルーティングを生成
  
  resources :books, only: [:index, :new, :show, :create ]
  # ユーザー関連のルーティング (indexとshowのみ許可)
  resources :users
  # , only: [:show, :index] 
  
  # トップページのルーティング
  root to: 'homes#top'

  # aboutページのルーティング
  get 'homes/about', to: 'homes#about'  # こちらもインデントに注意
end
