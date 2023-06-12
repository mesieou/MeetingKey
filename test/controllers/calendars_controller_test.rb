require "test_helper"

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get calendars_view_url
    assert_response :success
  end
end
