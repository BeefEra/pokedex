class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :name, null: false
    end
    add_index :types, :name, unique: true
  end
end
