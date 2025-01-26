class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # everything here avaiiable to all controllers not view if want view put in helper
  helper_method :current_user, :logged_in?
  # if session variable is set, finds the student based on id in the session
  def current_user
    # perform query only if current user object does not exists 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    # if current user returns truthy returns true else false
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end 
end
