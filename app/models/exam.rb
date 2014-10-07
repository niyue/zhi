class Exam < ActiveRecord::Base
  has_many :parts
  
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
  
  private
  def find_questions(question_type)
    Question.where({ question_type: question_type, exam_id: self.id })
  end
end
