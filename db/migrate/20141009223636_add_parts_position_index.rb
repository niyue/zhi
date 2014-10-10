class AddPartsPositionIndex < ActiveRecord::Migration
  def change
    add_index :parts, :position
  end
end
