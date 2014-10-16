class AddNoteToExams < ActiveRecord::Migration
  def change
    add_column :exams, :note, :text
  end
end
