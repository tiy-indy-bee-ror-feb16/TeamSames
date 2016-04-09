class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :not_me?

    private

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def require_user
    unless current_user
      flash[:danger] = "Log in for that, please!"
      redirect_to :root
    end
  end

  def disallow_user
    if current_user
      flash[:info] = "You're already logged in. Sparkle on!"
      redirect_to :root
    end
  end

  def not_me?
    current_user && current_user != @user
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end
