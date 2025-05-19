class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user),notice: "ユーザー#{@user.name}を追加しました"
    else
      render :new,status: 422
    end
  end

  def update
    @user = User.new(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_url(@user),notice: "ユーザー#{@user.name}を更新しました"
    else
      render :new,status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url,notice: "ユーザー#{@user.name}を削除しました"
  end


  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:admin,:password,:password_confirmation)
  end
end
