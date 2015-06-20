module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def require_logged_in
    unless logged_in?
      redirect_to login_path
    end
  end
end
