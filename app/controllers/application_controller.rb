class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to :controller => "user", :action => "login"
    return false 
  end
private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
helper_method :current_user

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to_url(return_to)
    else
      redirect_to :controller=>'user', :action=>'welcome'
    end
  end
end


