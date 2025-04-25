class ReviewsMailbox < ApplicationMailbox

  def process
      isbn = ISBN_PATTERN.match(mail.recipients[0]);
      @book = Book.find_by(isbn: isbn[1])
      return if @book.nil?

    content = ""
    if mail.parts.present?
      content = mail.parts[0].body.decoded
    else
      content = mail.decoded
    end

    Review.create book_id: @book.id, user_id: 99, status: 0, body: content
  end
end
