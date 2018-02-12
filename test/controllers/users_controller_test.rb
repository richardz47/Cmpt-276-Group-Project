require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "reject invalid inputs" do
    post users_path, params: {user: {username: "", email: "", password: "", password_confirmation: ""}}
    assert_not_equal(3, User.count)
  end

  test "new user should be created and redirected" do
    post users_path, params: {user: {username: "test", email: "test@test.com", password: "12345", password_confirmation: "12345"}}
    assert_equal(3, User.count)
  end

end
