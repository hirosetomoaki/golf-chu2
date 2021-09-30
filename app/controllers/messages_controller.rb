class MessagesController < ApplicationController
  
  def index
  end

  def create
    message = Message.create(message_params)
    redirect_to "/rooms/#{message.room.id}"
  end

  def destroy
    message = Message.find(params[:id])
    if room.destroy
      redirect_to room_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end
