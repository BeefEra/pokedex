class Move < ApplicationRecord
  belongs_to :type
  has_many :pokemon_moves, dependent: :destroy, foreign_key: :move_name, primary_key: :name
  has_many :pokemons, through: :pokemon_moves
  validates :name, presence: true
  validates :name, uniqueness: true
end
