# the relationship object between an exam and a question
class Question < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question, :polymorphic => true
end
