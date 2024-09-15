class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "You are not authorized to access this page."
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_name,:gender,:birth_date,:profile_pic])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_pic])
  end
end


