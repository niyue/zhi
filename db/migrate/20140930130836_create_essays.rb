class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :name
      t.text :description
      t.text :answer
      t.timestamps
    end
  end
end
