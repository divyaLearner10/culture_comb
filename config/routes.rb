Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :attractions, only: [:show, :destroy]
  resources :communities, only: [:show, :destroy]
  resources :events, only: [:show, :destroy]
  resources :posts, only: [:show, :destroy]

  resources :favorite_categories, only: [:index]
  resources :event_categories, only: [:index]
  resources :favorite_events, only: [:index]

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
    resources :communities
  end

  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end
end
