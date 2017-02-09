module BooksHelper
  # помощь в описании
  def get_book_description(book_description)
    if !book_description.nil?
      book_description
    else
      "—"
    end
  end

  # если nil — возвращает 'Не указан'
  def get_book_params(params)
    if !params.nil?
      params
    else
      "Не указан"
    end
  end
end

# склонятор автор, авторы
def sklonyator(author)
  if author.include?(" и ") || author.include?(" and ")
    "Авторы"
  else
    "Автор"
  end
end

def book_title_max_length
  Book::TITLE_MAX_LENGTH
end
