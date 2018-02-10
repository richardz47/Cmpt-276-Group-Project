require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "reject empty name" do
    @user = User.new(name: " ", email: "testing@test.com", password: "Testing1", password_confirmation: "Testing1")
    assert_not @user.valid?
  end

  test "reject name that is too long" do
    x = "x" * 101
    @user = User.new(name: x, email: "testing@test.com", password: "Testing1", password_confirmation: "Testing1")
    assert_not @user.valid?
  end


  test "reject empty email" do
    @user = User.new(name: "bob", email: " ", password: "Testing1", password_confirmation: "Testing1")
    assert_not @user.valid?
  end

  test "reject email that is too long" do
    z = ("z" * 91) + "@email.com" 
    @user = User.new(name: "bob", email: z, password: "Testing1", password_confirmation: "Testing1")
    assert_not @user.valid?
  end

  test "reject blank password" do
    @user = User.new(name: "bob", email: "testing@test.com", password: " ", password_confirmation: " ")
    assert_not @user.valid?
  end

  test "reject password that is too short" do
    @user = User.new(name: "bob", email: "testing@test.com", password: "Test1", password_confirmation: "Test1")
    assert_not @user.valid?
  end

  test "reject password that is too long" do
    y = "T" + ("x" * 50) + "1"
    @user = User.new(name: "bob", email: "testing@test.com", password: y, password_confirmation: y)
    assert_not @user.valid?
  end

end
