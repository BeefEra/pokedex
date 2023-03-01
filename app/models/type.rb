class Type < ApplicationRecord
  has_many :pokemon_types, dependent: :destroy, foreign_key: :type_name, primary_key: :name
  has_many :pokemons, through: :pokemon_types
  has_many :moves
  validates :name, presence: true
  validates :name, uniqueness: true
end
