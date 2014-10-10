require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  
  test 'get all multiple choices' do
    exam = exams(:nanjing)
    questions = exam.multiple_choices
    assert_equal 3, questions.length
    assert_not_nil questions[0].description
  end
  
  test 'should sort all multiple choices by position' do
    exam = exams(:nanjing)
    questions = exam.multiple_choices
    assert_equal 3, questions.length
    assert_equal multiple_choices(:binary_search_time_complexity).id, questions[0].id 
    assert_equal multiple_choices(:skip_list).id, questions[1].id 
    assert_equal multiple_choices(:inorder_traversal).id, questions[2].id 
  end
  
  test 'get all essay questions' do
    exam = exams(:nanjing)
    questions = exam.essays
    assert_equal 2, questions.length
  end
  
  test 'should sort all essay questions by position' do
    exam = exams(:nanjing)
    questions = exam.essays
    assert_equal 2, questions.length
    assert_equal essays(:linked_list_loop).id, questions[0].id 
    assert_equal essays(:permutation).id, questions[1].id 
  end
  
  test 'find part' do
    exam = exams(:nanjing)
    part = exam.find_part(multiple_choices(:binary_search_time_complexity))    
    assert_not_nil part
    assert_equal 'MultipleChoice', part.question_type
  end
  
  test 'get last part position' do
    exam = exams(:nanjing)
    assert_equal 2, exam.last_part_position('MultipleChoice')
  end
  
  test 'get last part position for exam without parts' do
    exam = exams(:xian)
    assert_equal 0, exam.last_part_position('MultipleChoice')
  end
  
  test 'reorder to move 0 to 1' do
    exam = exams(:nanjing)
    q = multiple_choices(:binary_search_time_complexity)
    exam.reorder(q.class.name, q.id, 0, 1)
    sorted_parts = exam.ordered_parts(q.class.name)
    assert_equal 3, sorted_parts.length
    assert_equal 1, sorted_parts[0].position
    assert_equal 2, sorted_parts[1].position
    assert_equal 3, sorted_parts[2].position
  end
  
  test 'reorder to move 1 to 0' do
    exam = exams(:nanjing)
    q = multiple_choices(:skip_list)
    exam.reorder(q.class.name, q.id, 1, 0)
    sorted_parts = exam.ordered_parts(q.class.name)
    assert_equal 3, sorted_parts.length
    assert_equal 0, sorted_parts[0].position
    assert_equal 1, sorted_parts[1].position
    assert_equal 3, sorted_parts[2].position
  end
  
  test 'reorder to move 0 to 2' do
    exam = exams(:nanjing)
    q = multiple_choices(:binary_search_time_complexity)
    exam.reorder(q.class.name, q.id, 0, 2)
    sorted_parts = exam.ordered_parts(q.class.name)
    assert_equal 3, sorted_parts.length
    assert_equal 1, sorted_parts[0].position
    assert_equal 2, sorted_parts[1].position
    assert_equal 3, sorted_parts[2].position
  end
  
  test 'reorder to move 2 to 0' do
    exam = exams(:nanjing)
    q = multiple_choices(:inorder_traversal)
    exam.reorder(q.class.name, q.id, 2, 0)
    sorted_parts = exam.ordered_parts(q.class.name)
    assert_equal 3, sorted_parts.length
    assert_equal 0, sorted_parts[0].position
    assert_equal 1, sorted_parts[1].position
    assert_equal 2, sorted_parts[2].position
  end
  
  test 'reorder to move 1 to 2' do
    exam = exams(:nanjing)
    q = multiple_choices(:skip_list)
    exam.reorder(q.class.name, q.id, 1, 2)
    sorted_parts = exam.ordered_parts(q.class.name)
    assert_equal 3, sorted_parts.length
    assert_equal 0, sorted_parts[0].position
    assert_equal 2, sorted_parts[1].position
    assert_equal 3, sorted_parts[2].position
  end
  
  test 'reorder to move 2 to 1' do
    exam = exams(:nanjing)
    q = multiple_choices(:inorder_traversal)
    exam.reorder(q.class.name, q.id, 2, 1)
    sorted_parts = exam.ordered_parts(q.class.name)
    assert_equal 3, sorted_parts.length
    assert_equal 0, sorted_parts[0].position
    assert_equal 1, sorted_parts[1].position
    assert_equal 2, sorted_parts[2].position
  end
end
