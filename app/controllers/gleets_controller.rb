class GleetsController < ApplicationController
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
    if @gleet.save
      flash[:success] = "A new Gleet shines in the sun!"
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    Gleet.find(params[:id]).destroy
    flash[:success] = "That Gleet has shined its last"
    redirect_to :root
  end

  private

  def gleet_params
    params.require(:gleet).permit(:body)
  end

end
