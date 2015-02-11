class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Ha iniciado sesión')
    else
      flash.now[:alert] = 'sesión fallida'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'sesión abortada')
  end
  skip_before_filter :require_login, except: [:destroy]
end
