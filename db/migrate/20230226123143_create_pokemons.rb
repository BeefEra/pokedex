class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :name, null: false
      t.integer :height
      t.integer :weight
      t.text :sprite
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.integer :base_experience
    end
    add_index :pokemons, :name, unique: true
  end
end
