Rails.application.routes.draw do
  root "pokemons#index"

  resources :abilities
  resources :moves
  resources :types
  resources :pokemons, only: %i[index show] do
    resources :abilities
  end
end
