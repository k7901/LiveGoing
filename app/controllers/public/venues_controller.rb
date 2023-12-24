class Public::VenuesController < ApplicationController
  
  def venues_for_prefecture
    prefecture_id = params[:prefecture_id]
    venues = Venue.where(prefecture_id: prefecture_id)
    render json: venues
  end
end
