class MessagesController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:user_id])
    @message = @user.messages.create(message_params)

    @message.save

    redirect_to @user
  end

  private

  def message_params
    params.require(:message).permit(:user, :text)
  end
end
