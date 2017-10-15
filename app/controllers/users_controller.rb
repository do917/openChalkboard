class UsersController < ApplicationController
  def create
    # render plain: user_params[:username]
    existing_user = User.find_by(username: user_params[:username])

    if existing_user
      @user = existing_user
    else
      @user = User.new(user_params)
      @user.save
    end
    
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    @messages = Message.all
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
