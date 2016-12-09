class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = current_user.books.build
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
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :genre, :year, :avatar_title)
  end
end
