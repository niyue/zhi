require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should show cover" do
    get :show, id: :cover
    assert_response :success
    assert_not_nil assigns(:cover)
  end
  
  test "should edit cover" do
    get :edit, id: :cover
    assert_response :success
    assert_not_nil assigns(:cover)
  end
  
  test "should update cover" do
    patch :update, id: :cover, cover: '<p>New cover</p>'
    assert_redirected_to setting_path(:cover)
    assert_not_nil assigns(:cover)
  end
end
