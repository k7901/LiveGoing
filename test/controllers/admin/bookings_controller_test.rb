require "test_helper"

class Admin::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_bookings_show_url
    assert_response :success
  end
end
