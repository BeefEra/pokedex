class CreatePokemonTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_types do |t|
      t.references :pokemon, null: false, foreign_key: { on_delete: :cascade }
      t.references :type, null: false, foreign_key: { on_delete: :cascade }
    end
  end
end
