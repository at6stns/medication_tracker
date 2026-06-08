class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username, :avatar ])
  end

  def after_sign_out_path_for(resource_or_scope)
    delete_guest_user
    new_user_session_path
  end

  private

  def delete_guest_user
    if current_user&.email&.start_with?("guest_")
      current_user.destroy
    end
  end
end
