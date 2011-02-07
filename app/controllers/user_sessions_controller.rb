class UserSessionsController < ApplicationController

  skip_before_filter :require_user, :except => [:destroy]

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

  def show
  end

  def destroy
    current_user_session.destroy
    redirect_to root_path
  end

end
