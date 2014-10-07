class Part < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question, :polymorphic => true
  
  def code
    "#{question_type}#{question_id}"
  end
end
