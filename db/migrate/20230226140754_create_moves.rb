class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :name, null: false
      t.integer :accuracy
      t.integer :pp
      t.integer :power
      t.string :damage_class
      t.integer :priority
      t.string :move_type
      t.references :type, null: false, foreign_key: { on_delete: :cascade }
    end
    add_index :moves, :name, unique: true
  end
end
