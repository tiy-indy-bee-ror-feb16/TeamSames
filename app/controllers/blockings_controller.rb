class BlockingsController < ApplicationController
  before_action :require_user

  def new
    other_user = User.find(params[:user_id])
    current_user.block(other_user)
    flash[:success] = "User #{other_user.username} has been blocked and can no longer follow you"
    redirect_to :back
  end

  def destroy
    other_user = User.find(params[:user_id])
    current_user.unblock(other_user)
    flash[:success] = "User #{other_user.username} has been unblocked.  We're all friends!  Yay!"
    redirect_to :back
  end

end
