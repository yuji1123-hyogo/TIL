class HelloController < ApplicationController
  def index
    render plain: 'hello world'
  end

  def view
    @msg = "ohayo"
  end

  def list
    @books = Book.all
  end
end
