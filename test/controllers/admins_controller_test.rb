require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get admins_user_url
    assert_response :success
  end

end
