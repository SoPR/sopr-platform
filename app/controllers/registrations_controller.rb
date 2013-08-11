class RegistrationsController < Devise::RegistrationsController
  def update
    clear_password_params if password_blank?

    @user = User.find_by(id: current_user.id)
    if @user.update_attributes(devise_parameter_sanitizer.for(:account_update))
      set_flash_message :notice, :updated

      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render 'edit'
    end
  end

  protected

  def password_blank?
    params[:user][:password].blank?
  end

  def clear_password_params
    # required for settings form to submit when password is left blank
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
end