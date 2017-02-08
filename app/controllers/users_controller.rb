class UsersController < ApplicationController

  def new
    @user = current_user.build(user_params)
  end

  def show
    @user = User.find(params[:id])

    # все книги пользователя
    @books = Book.all.where(user: @user)
  end

  def create
    if @user.save
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
