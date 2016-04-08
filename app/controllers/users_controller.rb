class UsersController < ApplicationController
  before_action :disallow_user, only: [:new, :create]

  def index
    @users = User.order(:created_at).page(params[:page])
  end

  def show
    if current_user
      @user = User.find(params[:id])
      @gleets = Gleet.timeline(@user).page(params[:page])
    else
      render 'static_pages/marketing'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Glitter!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
    end
end
