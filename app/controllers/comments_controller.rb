class CommentsController < ApplicationController
  before_action :authenticate_user!, expect: [:show, :index]
  before_action :set_book, only: [:create]
  before_action :set_comment, only: [:destroy]

  def create
      @new_comment = @book.comments.build(comment_params)
      @new_comment.user = current_user

      if @new_comment.save
        redirect_to @book, notice: 'Ваш комментарий добавлен'
      else
        render 'books/show', alert: 'Не удалось создать комментарий'
      end
  end


  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = @book.comment.find(params[:id])
  end
end
