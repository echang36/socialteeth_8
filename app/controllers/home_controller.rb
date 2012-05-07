class HomeController < ApplicationController
  def index
	@ads=Ad.order(:title)
  end

end
