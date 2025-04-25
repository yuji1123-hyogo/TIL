require "test_helper"

class FrontControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get front_hello_url
    assert_response :success
  end
end
