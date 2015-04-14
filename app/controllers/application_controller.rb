class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception
  
  private 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname,
      :lastname, :email, :password, :password_confirmation) }
  end
  
  def authorize_admin!
    unless current_user.try(:admin?) 
      redirect_to new_user_session_path
    end
  end
  


end
