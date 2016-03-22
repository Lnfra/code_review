class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Make current_user accessable from the view
  helper_method :get_current_user
  def get_current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].blank?
    return @current_user
  end

  def logged_in?
    if get_current_user.blank?
      false
    else
      true
    end
    # !!current_user
  end

  #Redirect to login page if user is not logged in
  def restrict_access
    unless logged_in?
      flash[:error] = "YOU MUST LOGIN!"
      redirect_to login_url
    end
  end

end
