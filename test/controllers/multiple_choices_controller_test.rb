require 'test_helper'

class MultipleChoicesControllerTest < ActionController::TestCase
  setup do
    @multiple_choice = multiple_choices(:skip_list)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multiple_choices)
  end
  
  test "should get index with tags" do
    get :index, tags: 'data_structure,binary_search_tree'
    assert_response :success
    assert_not_nil assigns(:multiple_choices)
    assert assigns(:multiple_choices).length > 0
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multiple_choice" do
    assert_difference('MultipleChoice.count') do
      post :create, multiple_choice: { description: @multiple_choice.description }
    end

    assert_redirected_to multiple_choice_path(assigns(:multiple_choice))
  end

  test "should show multiple_choice" do
    get :show, id: @multiple_choice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multiple_choice
    assert_response :success
  end

  test "should update multiple_choice" do
    patch :update, id: @multiple_choice, multiple_choice: { description: @multiple_choice.description }
    assert_redirected_to multiple_choice_path(assigns(:multiple_choice))
  end

  test "should destroy multiple_choice" do
    assert_difference('MultipleChoice.count', -1) do
      delete :destroy, id: multiple_choices(:probability)
    end

    assert_redirected_to multiple_choices_path
  end
  
   test "should not destroy multiple_choice with dependency" do
    assert_difference('MultipleChoice.count', 0) do
      delete :destroy, id: @multiple_choice
    end

    assert_redirected_to multiple_choices_path
  end
end
