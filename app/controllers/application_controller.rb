class ApplicationController < ActionController::Base

  protect_from_forgery
  before_filter :require_user

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    redirect_to root_path unless logged_in?
  end

end
