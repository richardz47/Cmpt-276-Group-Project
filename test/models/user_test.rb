require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "reject empty username" do
    @user = User.new(username: " ", email: "testing@test.com", password: "Testing1", password_confirmation: "Testing1")
    assert_not @user.valid?
  end

  test "reject username that is too short" do
    x = "x" * 2
    @user = User.new(username: x, email: "testing@test.com", password: "Testing1", password_confirmation: "Testing1")
    assert_not @user.valid?
  end

  test "reject username that is too long" do
    x = "x" * 31
    @user = User.new(username: x, email: "testing@test.com", password: "Testing1", password_confirmation: "Testing1")
    assert_not @user.valid?
  end


  test "reject empty email" do
    @user = User.new(username: "bob", email: " ", password: "Testing1", password_confirmation: "Testing1")
    assert_not @user.valid?
  end

  test "reject email that is too long" do
    z = ("z" * 21) + "@email.com" 
    @user = User.new(username: "bob", email: z, password: "Testing1", password_confirmation: "Testing1")
    assert_not @user.valid?
  end

  test "reject blank password" do
    @user = User.new(username: "bob", email: "testing@test.com", password: " ", password_confirmation: " ")
    assert_not @user.valid?
  end

  test "reject password that is too short" do
    @user = User.new(username: "bob", email: "testing@test.com", password: "Test", password_confirmation: "Test")
    assert_not @user.valid?
  end

  test "reject password that is too long" do
    y = "x" * 31
    @user = User.new(username: "bob", email: "testing@test.com", password: y, password_confirmation: y)
    assert_not @user.valid?
  end

end
