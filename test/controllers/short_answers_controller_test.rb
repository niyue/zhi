require 'test_helper'

class ShortAnswersControllerTest < ActionController::TestCase
  setup do
    @short_answer = short_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:short_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create short_answer" do
    assert_difference('ShortAnswer.count') do
      post :create, short_answer: { answer: @short_answer.answer, description: @short_answer.description, name: @short_answer.name }
    end

    assert_redirected_to short_answer_path(assigns(:short_answer))
  end

  test "should show short_answer" do
    get :show, id: @short_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @short_answer
    assert_response :success
  end

  test "should update short_answer" do
    patch :update, id: @short_answer, short_answer: { answer: @short_answer.answer, description: @short_answer.description, name: @short_answer.name }
    assert_redirected_to short_answer_path(assigns(:short_answer))
  end

  test "should destroy short_answer" do
    assert_difference('ShortAnswer.count', -1) do
      delete :destroy, id: @short_answer
    end

    assert_redirected_to short_answers_path
  end
end
