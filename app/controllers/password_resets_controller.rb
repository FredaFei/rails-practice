class PasswordResetsController < ApplicationController
  def create
    password_reset = PasswordReset.new create_params
    password_reset.user = current_user
    password_reset.validate
    render_resource password_reset
  end

  def create_params
    params.permit(:old_password, :new_password, :password_confirmation)
  end
end
