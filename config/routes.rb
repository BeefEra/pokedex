Rails.application.routes.draw do
  root "pokemons#index"

  resources :abilities
  resources :moves
  resources :types
  resources :pokemons, only: %i[index show]
end
