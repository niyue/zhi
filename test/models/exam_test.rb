require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  test 'get all multiple choices' do
    exam = exams(:nanjing)
    questions = exam.multiple_choices
    assert_equal 1, questions.length
    assert_not_nil questions[0].description
  end
  
  test 'get all essay questions' do
    exam = exams(:nanjing)
    questions = exam.essays
    assert_equal 1, questions.length
  end
end
