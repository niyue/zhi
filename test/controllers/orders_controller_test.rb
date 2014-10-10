require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @exam = exams(:nanjing)
  end
  
  test "should show exam questions in order" do
    get :show, exam_id: @exam
    assert_response :success
  end
  
  test "should update exam question orders" do
    q = multiple_choices(:skip_list)
    patch :update, exam_id: @exam, format: :json, 
      question_type: q.class.name, question_id: q.id, from: 2, to: 0
    assert_response :success
  end
end
