class PokemonType < ApplicationRecord
  belongs_to :pokemon, primary_key: :name
  belongs_to :type, primary_key: :name
end
