class Admin::HotelsController < ApplicationController

  def new
    @hotel = Hotel.new
    @venues = Venue.all
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to admin_hotels_path
    else
       redirect_to :back
    end
  end

  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    #@rooms = @hotel.room
  end

  def edit
     @hotel = Hotel.find(params[:id])
     @venues = Venue.all
  end

  def update
    @hotel = Hotel.find(params[:id])
    @hotel.update(hotel_params)
    redirect_to admin_hotel_path
  end

  def destroy

  end

   private

  def hotel_params
    params.require(:hotel).permit(:venue_id, :image, :name,:introduction, :address, :latitude, :longitude, service_ids: [])
  end

end