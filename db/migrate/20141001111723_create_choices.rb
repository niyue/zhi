class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :description
      t.boolean :correct, default: false
      t.references :multiple_choice, index: true

      t.timestamps
    end
  end
end
