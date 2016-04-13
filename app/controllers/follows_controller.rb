class FollowsController < ApplicationController
  before_action :require_user

  def new
    @user = User.find(params[:user_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { }
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render :new }
    end
  end

end
