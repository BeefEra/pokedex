class AddEffectToMoves < ActiveRecord::Migration[7.0]
  def change
    add_column :moves, :effect, :text
  end
end
