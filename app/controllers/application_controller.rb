class ApplicationController < ActionController::Base
  include Pundit::Authorization

  add_flash_types :info, :error, :warning

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  before_action :switch_locale

  def switch_locale
    I18n.locale = :da
  end




  before_action :configure_permitted_parameters, if: :devise_controller?
  # prepend_before_action :require_no_authentication, only: [:cancel ]
  before_action :authenticate_user!

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  private

  def not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_back(fallback_location: root_path)
  end

end