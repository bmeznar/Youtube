Rails.application.routes.draw do
  devise_for :users

  resources :videos do
    member do
      put "like"=>"videos#like"
      put "dislike"=>"videos#dislike"
    end
  end

  mount Commontator::Engine => '/commontator'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'videos#index'
end
