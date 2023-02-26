class Pokemon < ApplicationRecord
  has_many :pokemon_types, dependent: :destroy
  has_many :types, through: :pokemon_types
  validates :name, presence: true
  validates :name, uniqueness: true
end
