class CreatePokemonAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_abilities do |t|
      t.string :pokemon_name, null: false
      t.string :ability_name, null: false
    end
    add_index :pokemon_abilities, :pokemon_name
    add_index :pokemon_abilities, :ability_name
  end
end
