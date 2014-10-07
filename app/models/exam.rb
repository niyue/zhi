class Exam < ActiveRecord::Base
  has_many :questions
  
  def multiple_choices
    multiple_choice_questions = find_questions('MultipleChoice')
    question_ids = multiple_choice_questions.map do |q|
      q.question_id
    end    
    MultipleChoice.find(question_ids) 
  end
  
  def essays
    find_questions('Essay')
  end
  
  private
  def find_questions(question_type)
    Question.where({ question_type: question_type, exam_id: self.id })
  end
end
