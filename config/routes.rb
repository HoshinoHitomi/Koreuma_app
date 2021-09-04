Rails.application.routes.draw do
  # deviseのルーティング
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }
  devise_for :shops, controllers: {
    sessions: 'shops/sessions',
    passwords: 'shops/passwords',
    registrations: 'shops/registrations',
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  # 管理者側のルーティング
  namespace :admin do
    root to: 'homes#top'
    resources :informations
    resources :genres, except: [:new, :destroy]
    resources :shops, except: [:new, :create, :destroy]
    resources :users, except: [:new, :create, :destroy]
    resources :searches, only: [:index]
  end

  # 店側のルーティング
  namespace :shop do
    root to: 'homes#top'
    resource :homes, only: [:edit, :update]
    get '/homes/confirm' => 'homes#confirm', as: 'confirm'
    patch '/homes/withdrawl' => 'homes#withdrawl', as: 'withdrawl'
    resources :foods
  end

  # エンドユーザーのルーティング
  scope module: :public do
    # トップページ
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    get '/which_sign_up' => 'homes#which_sign_up', as: 'which_sign_up'
    get '/which_sign_in' => 'homes#which_sign_in', as: 'which_sign_in'
    get '/all_reviews' => 'homes#all_reviews', as: 'all_reviews'
    resources :informations, only: [:index, :show]

    # ユーザーのマイページ関連、お気に入り一覧へのルーティング
    resources :users, except: [:index, :new, :create, :destroy] do
      resources :favorite_foods, only: [:index]
      resources :favorite_shops, only: [:index]
      resources :reviews, only: [:index]
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get '/confirm' => 'users#confirm', as: 'confirm'
    patch '/withdrawl' => 'users#withdrawl', as: 'withdrawl'

    # 閲覧機能とお気に入り機能関連のルーティング
    resources :foods, only: [:index, :show] do
      resource :favorite_foods, only: [:create, :destroy]
      # レビュー投稿のルーティング
      resource :reviews, only: [:create, :edit, :update, :destroy] do
        resource :helphulnesses, only: [:create, :destroy]
      end
    end
    resources :shops, only: [:index, :show] do
      resource :favorite_shops, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
