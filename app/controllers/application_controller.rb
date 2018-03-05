class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception
  protect_from_forgery with: :exception
  # call the configured params
  before_action :configure_permitted_parameters, if: :devise_controller?
  # protect against SQL injection
  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username) }
  end
end
