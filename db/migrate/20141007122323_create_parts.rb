class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.references :exam, index: true
      t.integer :question_id
      t.string :question_type
      t.integer :position

      t.timestamps
    end
    add_index :parts, [:exam_id, :question_id, :question_type], :unique => true
  end
end
