class Admin::RoomsController < ApplicationController
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to admin_room_path(@room.id)
  end
  
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
   private

  def room_params
    params.require(:room).permit(:room_id, :image, :name, :introduction, :checklist, :price, :capacity, :amount )
  end
  
end

   
