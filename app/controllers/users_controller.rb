class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    uid = params[:id]
    @user = User.find_by(uid: uid)
    if @user == nil
        redirect_to action: "index"
    else    
        @user_khatamat = Khatma.where(user_id: @user.id.to_s)
    end
  end

end
