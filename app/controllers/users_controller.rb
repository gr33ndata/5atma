class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user_khatamat = User.find(current_user).khatmas
  end

end
