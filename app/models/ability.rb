class Ability < ApplicationRecord
  has_many :pokemon_abilities, dependent: :destroy, foreign_key: :ability_name, primary_key: :name
  has_many :pokemons, through: :pokemon_abilities
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["name", "id", "pokemon_abilities", "pokemon_name"]
  end
end
