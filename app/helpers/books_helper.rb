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
