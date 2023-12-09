require "test_helper"

class Admins::ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_services_new_url
    assert_response :success
  end

  test "should get index" do
    get admins_services_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_services_edit_url
    assert_response :success
  end
end
