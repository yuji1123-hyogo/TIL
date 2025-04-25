require 'kconv'

class CtrlController < ApplicationController
  # before／afterフィルターの登録
  # before_action :start_logger
  # after_action :end_logger

  # aroundフィルターの登録
  # around_action :around_logger

  # フィルターの適用範囲を制限
  # before_action :start_logger, only: [:index, :index2]
  # after_action :end_logger, except: :index

  # my_loggingフィルターを除外
  # skip_before_action :my_logging

  # indexアクションでのみmy_loggingフィルターを除外
  # skip_before_action :my_logging, only: :index

  def para
    render plain: "idパラメーター： #{params[:id]}"
  end

  def para_array
    render plain: "categoryパラメーター： #{params[:category].inspect}"
  end

  def req_head
    render plain: request.headers['User-Agent']
  end

  def req_head2
    @headers = request.headers
  end

  def double_render
    @book = Book.find(6)
    if @book.reviews.empty?
      # render 'simple_info'
      render 'simple_info' and return
    end
    render 'details_info'
  end

  def plain_render
    render plain: '<div style="color: Red;">今日は良い天気ですね。</div>'
    # render html: '<div style="color: Red;">今日は良い天気ですね。</div>'.html_safe
    # render html: '<div style="color: Red;">今日は良い天気ですね。</div>'
    # render inline: 'リクエスト情報：<%= debug request.headers %>'
  end

  def head_sample
    # head 404
    # head :not_found
    render plain: 'ファイルが見つかりませんでした。', status: :not_found
  end

  def redirect
    redirect_to 'https://wings.msn.to', allow_other_host: true
    # redirect_to action: :index
    # redirect_to controller: :hello, action: :list
    # redirect_to books_path
    # redirect_back fallback_location: { controller: 'hello', action: 'index' }
  end

  def file_send
    send_file 'C:/data/sample.zip'
    # send_file 'C:/data/wings.jpg', type: 'image/jpeg', disposition: :inline
    # send_file 'C:/data/doc931455.pdf', filename: 'Guideline.pdf'
  end

  def data_send
    books = Book.all
    result = "#{books.attribute_names.join(',')}\r"
    books.each do |b|
      result << "#{b.attributes.values.join(',')}\r"
    end
    send_data result.kconv(Kconv::SJIS, Kconv::UTF8), type: 'text/csv'
  end

  def res_head
    response.headers['Refresh'] = 3
    render plain: Time.now
  end

  def expires
    expires_in 30.minutes, public: true
    #expires_now
    render plain: Time.now
   end

  def log
    logger.unknown('unknown')
    logger.fatal('fatal')
    logger.error('error')
    logger.warn('warn')
    logger.info('info')
    logger.debug('debug')
    render plain: 'ログはコンソール、またはログファイルから確認ください。'
  end

  def get_json
    @books = Book.all
    render json: @books
  end

  def get_xml
    @books = Book.all
    render xml: @books
  end

  def download
    @books = Book.all
  end

  def cookie
    @email = cookies[:email]
  end

  def cookie_rec
    cookies[:email] = { value: params[:email],
      # path: '~wings',
      expires: 3.months.from_now, http_only: true }

    # cookies[:email] = params[:email]

    render plain: 'クッキーを保存しました。'
  end

  def cookie_del
    cookies.delete(:email)
    # cookies.delete(:email, path: '~wings')
    render plain: 'クッキーを削除しました。'
  end

  def session_show
    @email = session[:email]
  end

  def session_rec
    session[:email] = params[:email]
    render plain: 'セッションを保存しました。'
  end

  def session_del
    session[:email] = nil
    # reset_session
    render plain: 'セッションを削除しました。'
  end

  def index
    sleep 3
    render plain: 'indexアクションが実行されました。'
  end

  def index2
    sleep 3
    render plain: 'index2アクションが実行されました。'
  end

  def tokengen
    @token = User.find(1).generate_token_for(:password_reset)
  end

  def tokenby
    user = User.find_by_token_for(:password_reset, params[:token])
    render plain: user.inspect
  end

  private
    def start_logger
      logger.debug("[Start] #{Time.now.to_s}")
    end

    def end_logger
      logger.debug("[Finish] #{Time.now.to_s}")
    end

    def around_logger
      logger.debug("[Start] #{Time.now.to_s}")
      yield
      logger.debug("[Finish] #{Time.now.to_s}")
    end

    def my_logging
          logger.debug("[MyLog] #{Time.now.to_s}")
    end
end
