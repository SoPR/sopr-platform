class ApplicationController < ActionController::Base
  # Public Activity
  include PublicActivity::StoreController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    new_user? ? edit_user_registration_path(anchor: 'profile') : users_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {
      |u| u.permit(:role, :full_name, :username, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit! }
  end

  def new_user?
    current_user.sign_in_count.eql?(1)
  end
  
end
