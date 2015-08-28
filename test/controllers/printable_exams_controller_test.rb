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
  
  test "should show printable exam PDF version in compact mode" do
    get :show, id: @exam, format: :pdf, compact: true
    assert_response :success
  end
  
  test "should show printable exam PDF version for different paper size" do
    get :show, id: @exam, format: :pdf, paper_size: 'a5'
    assert_response :success
  end
  
  test "should show printable exam PDF version for different margin_left" do
    get :show, id: @exam, format: :pdf, margin_left: 20
    assert_response :success
  end
  
  test "should show printable exam with answer" do
    get :show, id: @exam, answer: true
    assert_response :success
  end
end
