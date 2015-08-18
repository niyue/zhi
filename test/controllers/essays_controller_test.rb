require 'test_helper'

class EssaysControllerTest < ActionController::TestCase
  setup do
    @essay = essays(:linked_list_loop)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:essays)
  end
  
  test "should get index with tags" do
    get :index, tags: 'probability'
    assert_response :success
    assert_not_nil assigns(:essays)
    assert assigns(:essays).length > 0
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get tag cloud" do
    get :tag_cloud
    assert_response :success
  end
  
  test "should create essay" do
    assert_difference('Essay.count') do
      post :create, essay: { name: 'hanoi', description: 'essay question' }
    end

    assert_redirected_to essay_path(assigns(:essay))
  end

  test "should show essay" do
    get :show, id: @essay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @essay
    assert_response :success
  end

  test "should update essay" do
    patch :update, id: @essay, essay: { name: 'hanoi', 
      description: 'medium difficulty question' }
    assert_redirected_to essay_path(assigns(:essay))
  end
  
  test "should update essay with tag" do
    assert_equal 0, @essay.tag_list.length
    patch :update, id: @essay, essay: { tag_list: ['data_structure', 'recursion'] }
    assert_redirected_to essay_path(assigns(:essay))
    assert_equal 2, assigns(:essay).tag_list.length
  end

  test "should destroy essay" do
    assert_difference('Essay.count', -1) do
      delete :destroy, id: essays(:remove_duplicates)
    end

    assert_redirected_to essays_path
  end
  
  test "should not destroy essay with dependency" do
    assert_difference('Essay.count', 0) do
      delete :destroy, id: @essay
    end

    assert_redirected_to essays_path
  end
end
