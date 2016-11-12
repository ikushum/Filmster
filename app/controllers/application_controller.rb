class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me, :username) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :avatar, :password_confirmation, :current_password, :username, :introduction) }
  end
   
end
