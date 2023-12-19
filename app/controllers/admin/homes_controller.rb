class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @bookings = Booking.page(params[:page])
  end
end
