class SessionController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email:session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url,notice: 'ログインしました'
    else
      render :new,status: 422
    end

    def destroy
      reset_session
    end
  end

  private

  def session_params
    params.require(:session).permit(:email,:password)
  end
end
