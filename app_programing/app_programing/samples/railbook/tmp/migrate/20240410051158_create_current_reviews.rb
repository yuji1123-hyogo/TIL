class CreateCurrentReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :current_reviews, as: 'SELECT books.*, reviews.body FROM books INNER JOIN reviews ON books.id=reviews.book_id'
  end
end
