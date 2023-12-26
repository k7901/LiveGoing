class Admin::CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.order(created_at: :desc).page(params[:page])
  end
  
  def show
    @user = User.find(params[:user_id])
    @comments = @user.comments.order(created_at: :desc).page(params[:page])
  end

  def destroy
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
    if @comment.destroy
       redirect_to admin_user_comment_path(@user), notice: 'コメントを削除しました。'
    else
       render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :star, :hotel_id, :user_id)
  end

end
