class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_name] = user.name
    params[:goto_next] ||= root_url
    #redirect_to root_url
    redirect_to params[:goto_next]
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to root_url
  end

end
