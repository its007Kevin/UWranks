class ApplicationController < ActionController::Base
  before_action :banned?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :except => [:landing]

  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      flash[:error] = "Your account has been suspended. Please email uwranks@gmail.com for further assistance."
      root_path
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username) }
    end
  private
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
end
