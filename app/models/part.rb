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
  
  def to_s
    "#{position}-#{question_type}#{question_id}"
  end
  
  def self.exams(question)
    parts = Part.where({ 
      question_id: question.id, 
      question_type: question.class.name })
    exam_ids = parts.reduce([]) do |ids, p| 
      ids << p.exam_id
      ids
    end
    Exam.find(exam_ids)
  end
  
end
