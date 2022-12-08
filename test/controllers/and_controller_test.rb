require 'test_helper'

class AndControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get and_view_url
    assert_response :success
  end

  test "should get assign_bug" do
    get and_assign_bug_url
    assert_response :success
  end

end
