require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy" do
    get pages_privacy_url
    assert_response :success
  end

end
