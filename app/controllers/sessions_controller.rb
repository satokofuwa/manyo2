class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user &.authenticate(params[:session][:password])
        session[:user_id]= user.id
        redirect_to user_path(user.id)
      else
        flash.now[:danger] = I18n.t('errors.messages.login')
        render new
      end
  end

  def destroy
  end

end
