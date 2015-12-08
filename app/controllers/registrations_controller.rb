class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :phone_number, :description, :avatar, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :phone_number, :description, :avatar, :email, :password, :password_confirmation, :current_password)
  end
end