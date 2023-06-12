Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :attractions, only: [:index, :new]
  resources :posts, only: [:index]
  resources :chatrooms, only: [:index]

  resources :events, only: [:show] do
    resources :favorite_events, only: [:new]
  end

  resources :cities, only: [:show] do
    resources :events, only: [:index, :new]
    resources :posts, only: [:new]
  end

  resources :users do
    resources :chatrooms, only: [:show]
  end
end
