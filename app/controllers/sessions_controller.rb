class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "You're logged in. Sparkle on!"
      session[:user_id] = user.id
      redirect_to user
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
