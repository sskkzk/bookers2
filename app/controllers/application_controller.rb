class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
   protected
 
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
  
  devise_parameter_sanitizer.permit(:sign_up, keys: [:email])

  devise_parameter_sanitizer.permit(:sign_up, keys: [:image]) 
  
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar))
  end
  
end
