require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user can have login" do
    u = User.new
    u.login = "eilif"
    assert_equal "eilif", u.login
  end

  test "user must have login" do
    u = User.new
    u.login = ""
    assert !u.valid?
  end

  test "user can have password" do
    u = User.new
    u.password = "secret"
    assert_equal "secret", u.password
  end

  test "user must have password" do
    u = User.new
    u.login = "mcgrubber"
    u.password = ""
    assert !u.valid?
  end

end
