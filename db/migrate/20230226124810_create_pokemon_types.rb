class CreatePokemonTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_types do |t|
      t.string :pokemon_name, null: false
      t.string :type_name, null: false
    end
    add_index :pokemon_types, :pokemon_name
    add_index :pokemon_types, :type_name
  end
end
