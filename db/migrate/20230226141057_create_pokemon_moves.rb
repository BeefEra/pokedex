class CreatePokemonMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_moves do |t|
      t.string :pokemon_name, null: false
      t.string :move_name, null: false
    end
    add_index :pokemon_moves, :pokemon_name
    add_index :pokemon_moves, :move_name
  end
end
