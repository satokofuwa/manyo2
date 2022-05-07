#ユーザーを管理するクラス
class UsersController < ApplicationController
  before_action :set_user, :check_user, only: %i[destroy edit show]
  def new 
    redirect_to tasks_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = I18n.t('shared.login')
        redirect_to user_path(@user.id), notice: I18n.t('shared.add')
      end 
  end

  def update 
    if @user.update(user_params)
      t('message.update')
    end
  end


  def show
    @tasks = Task.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    redirect_to tasks_path, notice: '管理者以外はアクセスできません' if @user.id != current_user.id
  end

 
  
end
