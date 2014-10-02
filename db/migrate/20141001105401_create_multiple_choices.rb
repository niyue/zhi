class CreateMultipleChoices < ActiveRecord::Migration
  def change
    create_table :multiple_choices do |t|
      t.text :description
      t.text :answer
      t.timestamps
    end
  end
end
