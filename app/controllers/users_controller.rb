class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def change_password
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      sign_in @user, :bypass => true
      redirect_to root_path, notice: t('users.passwords.update_success')
    else
      render :change_password
    end
  end

  private
  def user_params
    params.required(:user).permit(:password, :password_confirmation)
  end
end
