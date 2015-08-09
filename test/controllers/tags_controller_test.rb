require 'test_helper'

class TagsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:tags)
  end
  
  test "should get index with query" do
    get :index, q: 'd', format: :json
    assert_response :success
    assert_not_nil assigns(:tags)
    assert_equal 2, assigns(:tags).length
  end
end
