class FollowsController < ApplicationController
  before_action :require_user

  def new
    @user = User.find(params[:user_id])
    current_user.follow!(@user)
    redirect_to :back
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow!(@user)
    redirect_to :back
  end

end
