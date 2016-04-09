class SessionsController < ApplicationController
  before_action :disallow_user, only: [:create, :new]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "You're logged in. Sparkle on!"
      session[:user_id] = user.username
      redirect_to :root
    else
      flash[:danger] = "That email/password combination doesn't sparkle :)"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Glitter again soon!"
    redirect_to :root
  end
end
