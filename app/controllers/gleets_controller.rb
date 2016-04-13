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
    @this_gleet = Gleet.new(gleet_params)
    @this_gleet.user = current_user
    if @this_gleet.save
      flash[:success] = "A new Gleet shines in the sun!"
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js {}
      end
    else
      flash[:warning] = "Please, glitter responsibly."
      redirect_to current_user
    end
  end

  def destroy
    gleet = Gleet.find(params[:id])
    gleet.destroy if gleet.user == current_user
    flash[:success] = "That Gleet has shined its last"
    redirect_to :back
  end

  private

  def gleet_params
    params.require(:gleet).permit(:body)
  end
end
