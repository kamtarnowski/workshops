class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_cache_buster

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  def set_cache_buster
    response.headers["Cache-Control"] = "no-store"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << [:lastname, :firstname]
    devise_parameter_sanitizer.for(:account_update) << [:lastname, :firstname]
  end
end
