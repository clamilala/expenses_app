require 'test_helper'

class ListControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get list_top_url
    assert_response :success
  end

end
