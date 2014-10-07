require 'test_helper'

class PartsControllerTest < ActionController::TestCase
  setup do
    @part = parts(:nanjing_mc_binary_search)
    @exam = exams(:nanjing)
  end

  test "should get index" do
    get :index, exam_id: @exam
    assert_response :success
    assert_not_nil assigns(:parts)
  end

  test "should get new" do
    get :new, exam_id: @exam
    assert_response :success
    assert_equal 2, assigns(:parts).length
    question = multiple_choices(:binary_search_time_complexity)
    code = question.class.name + question.id.to_s
    assert assigns(:parts).has_key?(code)
  end

  test "should create part" do
    question = multiple_choices(:inorder_traversal)
    assert_difference('Part.count') do
      post :create, part: { exam_id: @part.exam_id, position: @part.position, question_id: question.id, question_type: 'MultipleChoice' }, exam_id: @exam
    end

    assert_redirected_to exam_part_path(@exam, assigns(:part))
  end

  test "should show part" do
    get :show, id: @part, exam_id: @exam
    assert_response :success
  end

  test "should update part" do
    patch :update, id: @part, part: { exam_id: @part.exam_id, position: @part.position, question_id: @part.question_id, question_type: @part.question_type }, exam_id: @exam
    assert_redirected_to exam_part_path(@exam, assigns(:part))
  end

  test "should destroy part" do
    assert_difference('Part.count', -1) do
      delete :destroy, id: @part, exam_id: @exam
    end

    assert_redirected_to exam_parts_path(@exam)
  end
end
