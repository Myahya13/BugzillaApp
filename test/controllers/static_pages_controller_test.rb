require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = " Rails Bugz App"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Rails Bugzilla  App"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | Rails Bugzilla App"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | Rails Bugzilla App"
  end

end