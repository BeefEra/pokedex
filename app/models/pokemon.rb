class Pokemon < ApplicationRecord
  has_many :pokemon_types, dependent: :destroy, foreign_key: :pokemon_name, primary_key: :name
  has_many :types, through: :pokemon_types
  has_many :pokemon_moves, dependent: :destroy, foreign_key: :pokemon_name, primary_key: :name
  has_many :moves, through: :pokemon_moves
  has_many :pokemon_abilities, dependent: :destroy, foreign_key: :pokemon_name, primary_key: :name
  has_many :abilities, through: :pokemon_abilities
  validates :name, presence: true
  validates :name, uniqueness: true
end
