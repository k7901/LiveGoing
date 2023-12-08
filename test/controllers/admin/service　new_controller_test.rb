require "test_helper"

class Admin::Service　newControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_service　new_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_service　new_edit_url
    assert_response :success
  end
end
