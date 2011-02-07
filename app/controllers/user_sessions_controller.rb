class UserSessionsController < ApplicationController

  def new
    @usersession = UserSession.new
  end

  def create
    @usersession = UserSession.new(params[:usersession])
    if @usersession.save
      redirect_to root_path
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to root_path
  end

end
