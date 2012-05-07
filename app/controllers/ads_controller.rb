class AdsController < ApplicationController
  
  before_filter :authenticate_user!, :except=>[:show, :index]
  load_and_authorize_resource
  
  
  def index
    @ads = Ad.all
  end

  def show
  #  @ad = Ad.find(params[:id])
  end

  def new
  #  @ad = Ad.new
  end

  def create	
  	@ad=current_user.ads.build(params[:ad])
	@ad.format=(params[:ad][:format])
    if @ad.save
      redirect_to @ad, :notice => "Successfully created ad."
    else
      render :action => 'new'
    end
  end

  def edit
 #   @ad = Ad.find(params[:id])
  end

  def update
  #  @ad = Ad.find(params[:id])
    if @ad.update_attributes(params[:ad])
      redirect_to @ad, :notice  => "Successfully updated ad."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to ads_url, :notice => "Successfully destroyed ad."
  end
end
