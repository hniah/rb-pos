class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def home

  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :username)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :dob, :gender, :area_interests, :avatar, :country)
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      rails_admin_path
    else
      root_path
    end
  end
end
