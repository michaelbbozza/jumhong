class ApplicationController < ActionController::Base
    include ApplicationHelper
  helper_method :require_logged_in
  # before_action :require_logged_in
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
