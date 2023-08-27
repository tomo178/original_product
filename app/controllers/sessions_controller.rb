class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(loginID: params[:session][:loginID].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session      # ログインの直前に必ずこれを書くこと
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid loginID/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end
end
