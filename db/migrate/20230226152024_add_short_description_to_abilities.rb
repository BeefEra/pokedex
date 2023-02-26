class AddShortDescriptionToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :short_description, :text
  end
end
