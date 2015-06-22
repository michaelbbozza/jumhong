class SessionsController < ApplicationController

  def new
  end

  def loginform
    render partial: "sessions/form"
  end

  def signup
    @new_user = User.new
  end

  def signupform
    render partial: "sessions/signup"
  end


  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to surveys_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username,:password)
  end

end
