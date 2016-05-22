class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Define all helper methods in ApplicationHelper
  #Include in ApplicationController so that controllers can access these methods as well.
  include ApplicationHelper

end
