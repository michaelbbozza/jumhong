require "bcrypt"

class UsersController < ApplicationController
  include ApplicationHelper
  before_action :require_logged_in

  def new
    # @new_user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to "/"
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
