require "test_helper"

class Test2ControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get test2_show_url
    assert_response :success
  end

  test "should get index" do
    get test2_index_url
    assert_response :success
  end
end
