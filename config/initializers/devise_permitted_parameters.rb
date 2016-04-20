module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :stripe_card_token, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :stripe_card_token])
  end

end

DeviseController.send :include, DevisePermittedParameters
