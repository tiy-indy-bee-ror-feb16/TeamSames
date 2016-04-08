class FollowsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    current_user.unfollow!(@user)
    redirect_to @user
  end

  def new
    @user = User.find(params[:user_id])
    current_user.follow!(@user)
    redirect_to @user
  end
end
