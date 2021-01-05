Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :videos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'videos#index'
end
