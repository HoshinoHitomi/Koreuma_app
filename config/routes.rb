Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :shops, controllers: {
    sessions: 'shops/sessions',
    passwords: 'shops/passwords',
    registrations: 'shops/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :informations
    resources :genres, except: [:new, :destroy]
  end

  namespace :shop do
    root to: 'homes#top'
    resource :homes, only: [:edit, :update]
    get '/homes/confirm' => 'homes#confirm', as: 'confirm'
    resources :foods
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    get '/which_sign_up' => 'homes#which_sign_up', as: 'which_sign_up'
    get '/which_sign_in' => 'homes#which_sign_in', as: 'which_sign_in'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
