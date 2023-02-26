class PokemonType < ApplicationRecord
  belongs_to :pokemon, foreign_key: :pokemon_name, primary_key: :name
  belongs_to :type, foreign_key: :type_name, primary_key: :name
end
