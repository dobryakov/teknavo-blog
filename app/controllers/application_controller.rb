class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_authorize
    if current_user.nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/404'
    end
  end

end
