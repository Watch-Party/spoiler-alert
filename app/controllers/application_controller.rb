class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

   def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:screen_name, :email, :password, :first_name, :last_name) }
       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:screen_name, :email, :password, :current_password, :avatar_url, :bio, :location, :first_name, :last_name) }
   end
end
