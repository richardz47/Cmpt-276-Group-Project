require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "reject invalid inputs" do
    post signup_path, params: {user: {username: "", email: "", password: "", password_confirmation: ""}}
    assert_equal(1, User.count)
  end

  test "new user should be created,logged in, and redirected" do
    post signup_path, params: {user: {username: "test", email: "test@test.com", password: "12345", password_confirmation: "12345"}}
    assert_equal(2, User.count)
    assert logged_in?
    assert_redirected_to ("/users/" + ((return_user_id).to_s)) 
  end

end
