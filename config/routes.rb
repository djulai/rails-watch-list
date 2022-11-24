Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "movies#index"

  resources :movies

  resources :bookmarks, only: %i[destroy]

  resources :lists do
    resources :bookmarks, only: %i[new index create]
  end
end
