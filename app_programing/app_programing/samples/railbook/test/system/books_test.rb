require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:modernjs)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "should create book" do
    visit books_url
    click_on "New book"

    check "Dl" if @book.dl
    fill_in "Isbn", with: '978-4-297-13288-1'
    fill_in "Price", with: @book.price
    fill_in "Published", with: @book.published
    fill_in "Publisher", with: @book.publisher
    fill_in "Title", with: @book.title
    click_on "Create Book"

    assert_text "Book was successfully created"
    # take_screenshot
    click_on "Back"
  end

  test "should update Book" do
    visit book_url(@book)
    click_on "Edit this book", match: :first

    check "Dl" if @book.dl
    fill_in "Isbn", with: @book.isbn
    fill_in "Price", with: @book.price
    fill_in "Published", with: @book.published
    fill_in "Publisher", with: @book.publisher
    fill_in "Title", with: @book.title
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "should destroy Book" do
    visit book_url(@book)
    click_on "Destroy this book", match: :first

    assert_text "Book was successfully destroyed"
  end
end
