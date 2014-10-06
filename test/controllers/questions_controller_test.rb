require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    exam = exams(:one)
    get :index, exam_id: exam
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new, exam_id: exams(:one)
    assert_response :success
  end

  test "should create question" do
    exam = exams(:one)
    assert_difference('Question.count') do
      post :create, question: { exam_id: @question.exam_id, position: @question.position, question_id: @question.question_id, question_type: @question.question_type }, exam_id: exam
    end

    assert_redirected_to exam_question_path(exam, assigns(:question))
  end

  test "should show question" do
    get :show, id: @question, exam_id: exams(:one)
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question, exam_id: exams(:one)
    assert_response :success
  end

  test "should update question" do
    exam = exams(:one)
    patch :update, id: @question, question: { exam_id: @question.exam_id, position: @question.position, question_id: @question.question_id, question_type: @question.question_type }, exam_id: exam
    assert_redirected_to exam_question_path(exam, assigns(:question))
  end

  test "should destroy question" do
    exam = exams(:one)
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question, exam_id: exam
    end

    assert_redirected_to exam_questions_path(exam)
  end
end
