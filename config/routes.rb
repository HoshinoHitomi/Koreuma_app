Rails.application.routes.draw do
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

  namespace :admin do
    root to: 'homes#top'
    resources :informations
    resources :genres, except: [:new, :destroy]
    resources :shops, except: [:new, :create, :destroy]
  end

  namespace :shop do
    root to: 'homes#top'
    resource :homes, only: [:edit, :update]
    get '/homes/confirm' => 'homes#confirm', as: 'confirm'
    patch '/homes/withdrawl' => 'homes#withdrawl', as: 'withdrawl'
    resources :foods
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    get '/which_sign_up' => 'homes#which_sign_up', as: 'which_sign_up'
    get '/which_sign_in' => 'homes#which_sign_in', as: 'which_sign_in'
    resources :informations, only: [:index, :show]
    resources :users, except: [:index, :new, :destroy]
    get '/confirm' => 'users#confirm', as: 'confirm'
    patch '/withdrawl' => 'users#withdrawl', as: 'withdrawl'
    resources :foods, only: [:index, :show]
    resources :shops, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
