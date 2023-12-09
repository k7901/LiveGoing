class Admin::VenuesController < ApplicationController

  def new
    @venue = Venue.new
    @prefectures = Prefecture.all
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
    redirect_to admin_venues_path
  end

  def index
    @venues = Venue.all
  end

  def edit
    @venue = Venue.find(params[:id])
     @prefectures = Prefecture.all
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to admin_venues_path
  end
  
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to admin_venues_path
  end
  
  private

  def venue_params
    params.require(:venue).permit(:name, :latitude, :longitude, :prefecture_id , :id)
  end

end
