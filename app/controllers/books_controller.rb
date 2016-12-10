class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    if current_user.present?
      @book = current_user.books.build
    else
      redirect_to '/users/sign_in', alert: I18n.t('controllers.book.create_error')
    end
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to root_path, notice: I18n.t('controllers.book.created')
    else
      render new
    end
  end

  def show
    @book = Book.find(params[:id])

    @new_comment = @book.comments.build(params[:comment])
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :genre, :year, :avatar_title, :comment)
  end
end
