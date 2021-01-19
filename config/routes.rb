Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :videos do
    member do
      put "like"=>"videos#like"
      put "dislike"=>"videos#dislike"
    end
  end

  mount Commontator::Engine => '/commontator'

  resources :users do
    resources :subscriptions, only: [:create]
  end

  resources :subscriptions, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'videos#index'
end
