class ViewController < ApplicationController
  def search
    render plain: '検索終了'
  end

  def field
    @book = Book.new
  end

  def select
    @book = Book.new(publisher: '技術評論社')
  end

  def col_select
    @book = Book.new(publisher: '技術評論社')
    @pubs = Book.select(:publisher).distinct
  end

  def group_select
    @review = Review.new
    @authors = Author.all
  end

  def dat_select
    @book = Book.find(1)
  end

  def week_select
    @book = Book.find(1)
  end

  def col_radio
    @book = Book.new(publisher: '技術評論社')
    @books = Book.select(:publisher).distinct
  end

  def fields_for
    @user = User.find(1)
  end

  def conc
    @books = Book.all
  end

  # def default_url_options(options = {})
  #  { charset: 'utf-8' }
  # end

  def adopt
    render layout: 'sub'
  end

  def multi
    render layout: 'layout'
  end

  def nest
    @msg = '今日も良い天気です。'
    render layout: 'child'
  end

  def partial_layout
    @book = Book.find(1)
  end

  def partial_col
    @books = Book.all
  end

  def partial_spacer
    @books = Book.all
  end
end
