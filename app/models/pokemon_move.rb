class PokemonMove < ApplicationRecord
  belongs_to :pokemon, foreign_key: :pokemon_name, primary_key: :name
  belongs_to :move, foreign_key: :move_name, primary_key: :name
end
