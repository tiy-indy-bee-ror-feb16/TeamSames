class GleetsController < ApplicationController

  def index
    @gleets = Gleet.order(:created_at).page(params[:page])
  end

  def new
    @gleet = Gleet.new
    @user = User.find(params[:user_id])
  end

  def create
    @gleet = Gleet.new(gleet_params)
    @gleet.user_id = params[:user_id]
    if @gleet.save
      flash[:success] = "New Gleet created!"
      redirect_to :root
    else
      render :new
    end
  end

  private

  def gleet_params
    params.require(:gleet).permit(:body)
  end

end
