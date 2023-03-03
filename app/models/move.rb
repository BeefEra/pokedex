class Move < ApplicationRecord
  belongs_to :type
  has_many :pokemon_moves, dependent: :destroy, foreign_key: :move_name, primary_key: :name
  has_many :pokemons, through: :pokemon_moves
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["name", "id", "type_name", "pokemon_abilities", "pokemon_moves", "pokemon_types", "types"]
  end
end
