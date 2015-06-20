require "bcrypt"

class UsersController < ApplicationController
  include ApplicationHelper
  before_action :require_logged_in

  def new
    @new_user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      redirect_to login_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
