class LoginController < ApplicationController
  #  skip_before_action :check_logined

  def auth
    authed = User.authenticate_by(username: params[:username],
      password: params[:password])
    if authed
      reset_session
      session[:usr] = authed.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザー名／パスワードが間違っています。'
      render 'index'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
