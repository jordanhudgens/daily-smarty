module DeviseConcern
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :username, user_images_attributes: [:id, :img]])
  end
end
