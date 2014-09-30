class CreateShortAnswers < ActiveRecord::Migration
  def change
    create_table :short_answers do |t|
      t.string :name
      t.text :description
      t.text :answer

      t.timestamps
    end
  end
end
