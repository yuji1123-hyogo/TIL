class ApplicationController < ActionController::Base
  # protect_from_forgery with: :reset_session
  # before_action :check_logined
  # before_action :detect_device
  # before_action :detect_locale

  # rescue_from ActiveRecord::RecordNotFound, with: :id_invalid

  add_flash_types :info

  # def default_url_options(options = {})
  #   { locale: I18n.locale }
  # end

  private
  def id_invalid(e)
    render 'shared/record_not_found', status: 404
  end

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

  def detect_device
    if browser.device.mobile?
      request.variant = :mobile
    elsif browser.device.tablet?
      request.variant = :tablet
    end
  end

  def detect_locale
    # ブラウザの言語設定に応じてロケールを変更
    I18n.locale = request.headers['Accept-Language'].scan(/\A[a-z]{2}/).first

    # クエリ情報によってロケールを変更
    # I18n.locale = params[:locale]
  end
end
