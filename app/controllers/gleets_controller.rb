class GleetsController < ApplicationController

  def index
    @gleets = Gleet.order(:created_at).page(params[:page])
  end

  def new
    @gleet = Gleet.new
  end

  def create
    @gleet = Gleet.new(gleet_params)
    if @gleet.save
      flash[:success] = "New Gleet created!"
      redirect_to user_path
    else
      render :new
    end
  end

  private

  def gleet_params
    params.require(:gleet).permit(:body)
  end

end
