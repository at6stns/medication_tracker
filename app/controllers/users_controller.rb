class UsersController < ApplicationController
  def show
    @user = current_user
  end
end

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
end
