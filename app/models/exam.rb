class Exam < ActiveRecord::Base
  has_many :parts, :dependent => :destroy
  
  def multiple_choices
    find_questions(MultipleChoice)
  end
  
  def essays
    find_questions(Essay)
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
  
  def last_part_position(question_type)
    last_part = ordered_parts(question_type).last
    last_part ? last_part.position : 0
  end
  
  def ordered_parts(question_type)
    parts.where({ question_type: question_type }).order(position: :asc)
  end
  
  def reorder(question_type, question_id, from, to)
    sorted_parts = ordered_parts(question_type)
    part = parts.where({ question_type: question_type, question_id: question_id }).first
    if part
      if from < to
        Part.transaction do
          part.position = sorted_parts[to].position + 1
          if sorted_parts.length > to + 1
            after_to_parts = parts.where('position >= ?', sorted_parts[to + 1].position)
            after_to_parts.each do |p|
              p.position += 1
              p.save
            end
          end
          part.save          
        end
      else
        Part.transaction do
          part.position = sorted_parts[to].position
          if sorted_parts.length > to 
            after_to_parts = parts.where('position >= ?', sorted_parts[to].position)
            after_to_parts.each do |p|
              p.position += 1
              p.save
            end
          end
          part.save
        end
      end
    else
      logger.warn({
        type: 'reordered_part_cannot_be_found',
        question_id: question_id,
        question_type: question_type,
        exam_id: id
      })
    end
  end
  
  private
  def find_questions(question_class)
    question_class.joins(:parts)
      .where(parts: { exam_id: self.id })
      .order('parts.position ASC')
  end
end
