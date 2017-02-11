class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_current_user, only: [:edit, :update, :destroy]

  def new
    @user = current_user.build(user_params)
  end

  def show
    @user = User.find(params[:id])

    # все книги пользователя
    @books = Book.all.where(user: @user)
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: I18n.t('controllers.user.updated')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: I18n.t('controllers.user.destroyed')
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :provider, :uid)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

end
