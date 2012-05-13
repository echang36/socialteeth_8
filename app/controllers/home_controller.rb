class HomeController < ApplicationController
  def index
    @featuredAd = Ad.last
    @ads=Ad.order(:title)
  end
end
