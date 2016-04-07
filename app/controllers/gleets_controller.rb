class GleetsController < ApplicationController

  def index
    @gleets = Gleet.all
  end

end
