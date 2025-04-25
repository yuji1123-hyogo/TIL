class HelloController < ApplicationController
  # before_action :check_logined, only: :view
  # skip_before_action :check_logined, only: :list

  def index
    render plain: 'こんにちは、世界！'
  end

  def view
    @msg = 'こんにちは、世界！'
  end

  def list
    @books = Book.all
    # @books = Book.all.load_async
  end

  private
    def check_logined
      if session[:usr] then

        begin
          @usr = User.find(session[:usr])

        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end

      unless @usr
        flash[:referer] = request.fullpath
        redirect_to controller: :login, action: :index
      end
    end
end
