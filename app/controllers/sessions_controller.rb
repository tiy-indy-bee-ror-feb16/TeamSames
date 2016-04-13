class SessionsController < ApplicationController
  before_action :disallow_user, only: [:create, :new]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.username
      respond_to do |format|
        format.html {
          flash[:success] = "You're logged in. Sparkle on!"
          redirect_to :root
        }
        format.js { }
      end
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
