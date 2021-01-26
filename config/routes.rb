Rails.application.routes.draw do
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

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


  post '/playlist/add/:id', to: 'playlists#add', as: 'playlist_add'
  delete '/playlist/remove/:id', to: 'playlists#remove', as: 'playlist_remove'

  get 'user/myprofile' => 'users#myprofile'
  get 'user/user_profile/:id' => 'users#user_profile', as: 'user_user_profile'
  get 'user/subscribers' => 'users#subscribers'
  get 'user/myplaylist' => 'users#myplaylist'

  delete 'video/:id' => 'videos#destroy', as: 'video_delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'videos#index'
end
