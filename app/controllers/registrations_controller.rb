class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path(resource)
    jobs_path
  end
end 