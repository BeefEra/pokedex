class Ability <
  has_many :pokemon_abilities, dependent: :destroy
  has_many :pokemons, through: :pokemon_abilities
  validates :name, presence: true
  validates :name, uniqueness: true
end
