class PokemonAbility < ApplicationRecord
  belongs_to :pokemon, foreign_key: :pokemon_name, primary_key: :name
  belongs_to :ability, foreign_key: :ability_name, primary_key: :name
end
