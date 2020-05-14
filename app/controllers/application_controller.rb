class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  helper_method :current_user
  
  private
  
  def current_user
    # if session[:user_id] then session[:user_id] else 0
    user_id = session[:user_id] ? session[:user_id] : 0

    #@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by(id: user_id)
  end
  
  def login_required
    redirect_to "/" unless current_user
  end
end
