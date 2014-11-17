class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
 
  def set_locale
    #I18n.locale = I18n.default_locale
    I18n.locale = :ar
  end


  private
  def current_user
    #session.clear
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  private
  def current_url
    @current_url = request.original_url
  end
  helper_method :current_url


end
