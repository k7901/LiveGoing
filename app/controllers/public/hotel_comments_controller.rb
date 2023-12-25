class Public::HotelCommentsController < ApplicationController
  def new
  end

  def create
    hotel = Hotel.find(params[:id])
    comment = current_customer.comments.new(comment_params)
    comment.hotel_id = hotel.id
    comment.save
    redirect_back fallback_location: root_path
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
