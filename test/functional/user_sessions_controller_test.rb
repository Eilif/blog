require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase

  test "should get new user session" do
    get :new
    assert_response :success
  end

  test "create should save user session and redirect to root path" do
    @user = User.create!(:login => "urd", :password => "oldsecret")
    post :create, :user_session => {:login => "urd", :password => "oldsecret"}
    assert_equal @user, UserSession.find.record
    assert_redirected_to root_path
  end

  test "nonexistant user should not create user session, render new" do
    post :create, :user_session => {:login => "", :password => ""}
    assert_nil UserSession.find
    assert_template :new
  end

  test "logout should destroy user session and redirect to root path" do
    @user = User.create!(:login => "urd", :password => "oldsecret")
    UserSession.create!(:login => "urd", :password => "oldsecret")
    delete :destroy
    assert_nil UserSession.find
    assert_redirected_to root_path
  end

end
