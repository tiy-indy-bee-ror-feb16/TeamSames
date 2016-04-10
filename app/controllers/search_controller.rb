class SearchController < ApplicationController

  def users
    if params[:query].present?
      @users = User.search(params[:query]).order(:created_at).page(params[:page])
    else
      @users = User.order(:created_at).page(params[:page])
    end
    render 'users/index'
  end

  def gleets
    if params[:query]
      @gleets = Gleet.search(params[:query]).order(created_at: :desc).page(params[:page])
    else
      @gleets = Gleet.order(created_at: :desc).page(params[:page])
    end
    render 'gleets/index'
  end
end
