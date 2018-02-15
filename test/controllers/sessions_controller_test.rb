require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "valid login info" do
    @test = users(:test)
    post login_path, params: {email: @test.email, password: @test.password}
    assert check_logged_in
    assert_redirected_to ("/users/" + ((@test.id).to_s))
  end

  test "invalid login info" do
    post login_path, params: {email: "", password: ""}
    assert_not check_logged_in
  end

end
