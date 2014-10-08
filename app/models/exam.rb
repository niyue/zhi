class Exam < ActiveRecord::Base
  has_many :parts, :dependent => :destroy
  
  def multiple_choices
    multiple_choice_questions = find_questions('MultipleChoice')
    question_ids = multiple_choice_questions.map do |q|
      q.question_id
    end    
    MultipleChoice.find(question_ids) 
  end
  
  def essays
    essay_questions = find_questions('Essay')
    question_ids = essay_questions.map do |q|
      q.question_id
    end    
    Essay.find(question_ids)
  end
  
  def find_part(question)
    logger.debug({
      type: 'find_a_part_for_exam',
      parts: self.parts.length,
      question_id: question.id,
      question_type: question.class.name
    })
    self.parts.find{|p| p.question_id == question.id and p.question_type == question.class.name}
  end
  
  private
  def find_questions(question_type)
    Part.where({ question_type: question_type, exam_id: self.id })
  end
end
