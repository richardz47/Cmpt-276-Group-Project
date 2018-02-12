require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "reject invalid inputs" do
    assert_no_difference('User.count') do
      post users_path, params: {user: {username: "", email: "", password: "", password_confirmation: ""}}
    end
  end

  test "new user should be created and redirected" do
    assert_difference('User.count') do
      post users_path, params: {user: {username: "test", email: "test@test.com", password: "12345", password_confirmation: "12345"}}
    end
    assert_redirected_to '/users/980190963' # This is always the user id my fixtures generated during testing, so I'll just leave
                                            # the id as that for now.
  end

end
