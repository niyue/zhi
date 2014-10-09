require 'test_helper'

class PrintableExamsControllerTest < ActionController::TestCase
  setup do
    @exam = exams(:shanghai)
  end
  
  test "should show printable exam HTML version" do
    get :show, id: @exam
    assert_response :success
  end
  
  test "should show printable exam PDF version" do
    get :show, id: @exam, format: :pdf
    assert_response :success
  end
  
  test "should show printable exam with answer" do
    get :show, id: @exam, answer: true
    assert_response :success
  end
end
