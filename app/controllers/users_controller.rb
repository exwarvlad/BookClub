class UsersController < ApplicationController

  def new
    @user = current_user.build(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
