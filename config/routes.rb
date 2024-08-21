Rails.application.routes.draw do
  # 以下テスト用
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # 以下アプリ用
  # ユーザー登録
  resources :users, only: %i[new]
  # ログイン・ログアウト
  get "login" => "user_sessions#new", as: :login

  # お買い物リスト作成用
  resources :shopping_lists, only: %i[index show new]
  # リスト作成用のメンバー登録
  resources :member_infos, only: %i[new]
end
