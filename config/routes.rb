Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :attractions, only: [:show]

  resources :favorite_categories, only: [:index]
  resources :event_categories, only: [:index]
  resources :favorite_events, only: [:index]

  resources :categories, only: [:index, :new, :show, :create] do
    resources :favorite_categories, only: [:new, :create]
  end


  resources :events, only: [:show] do
    resources :favorite_events, only: [:new, :create]
    resources :categories, only: [:index] do
      resources :event_categories, only: [:new, :create]
    end
  end

  resources :cities, only: [:index, :show, :new, :create] do
    resources :events, only: [:index, :new, :create]
    resources :posts, only: [:index, :new, :show, :create]
    resources :attractions, only: [:index, :new, :create]
    resources :communities, only: [:index, :new, :create]
  end

  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end
end
