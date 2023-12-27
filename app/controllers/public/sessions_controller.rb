# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to hotels_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def after_sign_up_path_for(resource)
    hotels_path
  end

   private

  def user_state
    user = User.find_by(email: params[:user][:email])
    Rails.logger.debug("User: #{user.inspect}")
    return if user.nil?
    return unless user.valid_password?(params[:user][:password])
    if customer.is_active == false
      redirect_to new_user_registration_path
    end
  end

   protected

   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
   end
end
