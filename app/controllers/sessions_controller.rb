class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
    end
    redirect_to surveys_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to surveys_path
  end

  private

  def session_params
    params.require(:session).permit(:username,:password)
  end

end
