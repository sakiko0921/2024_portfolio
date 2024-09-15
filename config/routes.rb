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
  root "welcome_pages#index"

  resources :users, only: %i[new create]
  # ログイン・ログアウト
  get "login" => "user_sessions#new", as: :login
  post "login" => "user_sessions#create"
  delete "logout" => "user_sessions#destroy", as: :logout

  resources :shopping_lists, only: %i[index show new create edit update]
  resources :member_infos, only: %i[new create destroy]
  resources :daily_necessity_items, only: %i[new create edit update destroy]
  resources :daily_necessities, only: %i[create]
  resources :foods, only: %i[new]
  resources :food_items
end
