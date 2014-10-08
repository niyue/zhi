class Part < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question, :polymorphic => true
  
  def code
    "#{question_type}#{question_id}"
  end

  def self.has_dependent?(question)
    depedents = Part.where({ 
      question_id: question.id, 
      question_type: question.class.name }).count
    logger.debug({
      type: 'count_question_dependencies',
      depedents: depedents,
      question_id: question.id,
      question_type: question.class.name
    })
    return depedents > 0
  end
end
