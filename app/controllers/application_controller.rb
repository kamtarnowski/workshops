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

  def user_status(n)
    if n <= 10
      'Newbie'
    elsif n <= 50
      'Amateur'
    else
      'Hardcore'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:lastname, :firstname, :avatar]
    devise_parameter_sanitizer.for(:account_update) << [:lastname, :firstname, :avatar]
  end
end
