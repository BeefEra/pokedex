Rails.application.routes.draw do
  root "pokemons#index"

  resources :abilities
  resources :moves
  resources :types
  resources :pokemons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
