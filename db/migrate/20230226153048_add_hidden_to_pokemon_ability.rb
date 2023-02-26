class AddHiddenToPokemonAbility < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemon_abilities, :hidden, :boolean
  end
end
