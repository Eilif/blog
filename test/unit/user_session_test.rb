require 'test_helper'

class UserSessionTest < ActiveSupport::TestCase

  test "existing user can log in with correct info" do
    user = User.create! :password => "secret", :login => "eilif"
    user_session = UserSession.new :password => "secret", :login => "eilif"
    assert user_session.valid?
  end

  test "existing user cannot log in with wrong password" do
    user = User.create! :password => "password", :login => "eilif"
    user_session = UserSession.new :password => "secret", :login => "eilif"
    assert !user_session.valid?
  end

  test "spurious logins don't work" do
    user = User.create! :password => "secret", :login => "eilif"
    user_session = UserSession.new :password => "secret", :login => "mcgrubber"
    assert !user_session.valid?
  end

  test "nonexistant user can't initiate user session" do
    user_session = UserSession.new :password => "anything", :login => "mcgrubber"
    assert !user_session.valid?
  end

end
