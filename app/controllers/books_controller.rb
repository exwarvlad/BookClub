class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_book, only: [:show]
  before_action :set_current_user_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all.order("created_at ASC")
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)
    @book.update_attributes(user_name: @book.user.name)

    if @book.save
      redirect_to root_path, notice: I18n.t('controllers.book.created')
    else
      render :new
    end
  end

  def show
    @new_comment = @book.comments.build(params[:comment])
  end

  def edit

  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: I18n.t('controllers.book.updated')
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      redirect_to root_path, notice: I18n.t('controllers.book.destroyed')
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :genre, :year, :avatar_title, :comment)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_current_user_book
    @book = current_user.books.find(params[:id])
  end
end
