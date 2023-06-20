Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # users/show

  resources :users, only: [:show]

  resources :attractions, only: [:index, :show, :new, :destroy]
  resources :communities, only: [:destroy]
  resources :events, only: [:show, :destroy]
  resources :posts, only: [:show, :destroy]

  resources :favorite_categories, only: [:index]
  resources :event_categories, only: [:index]
  resources :favorite_events, only: [:index, :destroy]

  resources :categories do
    resources :favorite_categories, only: [:new, :create]
  end

  resources :events, only: [:show] do
    resources :favorite_events, only: [:new, :create]
    resources :categories, only: [:index] do
      resources :event_categories, only: [:new, :create]
    end
  end

  resources :cities do
    resources :events
    resources :posts
    resources :attractions
    resources :communities do
      resources :events
      resources :posts
    end
  end

  resources :events do
    post 'add_to_favorites', on: :member
    # get 'city_events', on: :collection
    # get 'favorite_events', on: :collection
  end

  resources :chatrooms, only: [:index, :new, :create, :show, :destroy] do
    resources :messages, only: :create
  end
end
