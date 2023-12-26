class Admin::RoomsController < ApplicationController
  def new
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.new
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.new(room_params)
    if @room.save
      redirect_to admin_hotel_path(@hotel)
    else
      logger.debug @room.errors.full_messages
      render :new
    end
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
  end

  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
    if @room.update(room_params)
      redirect_to admin_hotel_room_path(@hotel,@room)
    else
      render :edit
    end
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
    @room.destroy
      redirect_to admin_hotels_path
  end

   private

  def room_params
    params.require(:room).permit(:room_id, :hotel_id, :image, :name, :introduction, :checklist, :price, :guest, :amount )
  end

end


