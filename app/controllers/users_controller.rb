class UsersController < ApplicationController
  before_action :disallow_user, only: [:new, :create]
  before_action :require_user, only: [:index, :show]

  def index
    @users = User.order(:created_at).page(params[:page])
  end

  def show
    if current_user
      @user = params[:id] ? User.find_by(username: params[:id]) : current_user
      if not_me?
        @gleets = Gleet.where(user_id: @user.id).page(params[:page])
      else
        @gleets = Gleet.timeline(@user).page(params[:page])
      end
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
    params.require(:user).permit(:username, :name, :email, :password,
                                 :password_confirmation)
  end
end
