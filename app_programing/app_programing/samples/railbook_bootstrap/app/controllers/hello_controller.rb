class HelloController < ApplicationController
  # before_action :check_logined, only: :view
  # skip_before_action :check_logined, only: :list

  def list
    @books = Book.all
  end
end
