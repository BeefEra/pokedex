class CreateAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :abilities, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :name, null: false
      t.text :effect
    end
  end
end
