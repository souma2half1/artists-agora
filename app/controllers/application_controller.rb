class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def application
   @image = current_user.image
  end
  
  def public_or_guest
    if current_user.email == "guest@example.com"
      redirect_to works_path
    end
  end
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
  end

end
