class GleetsController < ApplicationController
  include GleetsHelper
  before_action :require_user, only: [:new, :create, :destroy]

  def index
    @gleets = Gleet.order(:created_at => :desc).page(params[:page])
  end

  def new
    @gleet = Gleet.new
    @user = User.find(params[:user_id])
  end

  def create
    @gleet = Gleet.new(gleet_params)
    @gleet.user_id = params[:user_id]
    sparkling_sparkler(@gleet.body)
    if @gleet.save
      flash[:success] = "A new Gleet shines in the sun!"
      redirect_to user_path(id: current_user.username)
    else
      flash[:warning] = "Please, glitter responsibly."
      redirect_to user_path(id: current_user.username)
    end
  end

  def destroy
    Gleet.find(params[:id]).destroy
    flash[:success] = "That Gleet has shined its last"
    redirect_to :back
  end

  private

  def gleet_params
    params.require(:gleet).permit(:body)
  end
end
