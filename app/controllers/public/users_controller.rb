class Public::UsersController < ApplicationController
 before_action :authenticate_user!


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
     @user = current_user
    if @user.update(user_params)
       redirect_to users_show_path
    else
       render 'edit'
    end
  end

  def withdraw
    @user = current_user
    if @user.update(is_active: false)
      sign_out(@user)
       redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name,:first_name, :email, :is_active)
  end


end
