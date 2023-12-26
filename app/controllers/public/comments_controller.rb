class Public::CommentsController < ApplicationController
  def new
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = current_user.comments.new(comment_params)
    @comment.hotel_id = @hotel.id
    if @comment.save

    redirect_back fallback_location: root_path
    else
      # 保存が失敗した場合の処理
      flash[:alert] = "コメントの保存に失敗しました。"
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :star, :hotel_id)
  end
end






