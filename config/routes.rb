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

  resources :categories, only: [:index, :new, :show] do
    resources :favorite_categories, only: [:new]
  end


  resources :events, only: [:show] do
    resources :favorite_events, only: [:new]
    resources :categories, only: [:index] do
      resources :event_categories, only: [:new]
    end
  end

  resources :cities, only: [:index, :show] do
    resources :events, only: [:index, :new]
    resources :posts, only: [:index, :new, :show]
    resources :attractions, only: [:index, :new]
    resources :communites, only: [:index, :new]
  end

  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end
end
