class Ability < ApplicationRecord
  has_many :pokemon_abilities, dependent: :destroy, foreign_key: :ability_name, primary_key: :name
  has_many :pokemons, through: :pokemon_abilities
  validates :name, presence: true
  validates :name, uniqueness: true
end
