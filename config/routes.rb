Rails.application.routes.draw do
  root "pokemons#index"

  get "/about", to: "about#index", as: "about"
  resources :abilities
  resources :moves
  resources :types
  resources :pokemons, only: %i[index show]
end
