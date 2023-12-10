# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  def after_sign_up_path_for(resource)
    root_path
  end
  
   protected

   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
   end
end
