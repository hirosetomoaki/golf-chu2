class RoomsController < ApplicationController

  def index
    @rooms = Room.all.order("created_at DESC")
  end


  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path
    else
      render :edit
    end
  end

  def destroy
    room = Room.find(params[:id])
    if room.destroy
      redirect_to root_path
    end
  end


  private
  
  def room_params
    params.require(:room).permit(:name, :concept, :score, :about_age, :member, user_ids: []).merge(user_id: current_user.id)
  end


end
