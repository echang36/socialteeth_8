class ContributionsController < ApplicationController
  def index
    @contributions = Contribution.all
  end

  def show
    @contribution = Contribution.find(params[:id])
  end

  def new
    @contribution = Contribution.new
  end

  def create
	@ad=Ad.find(params[:ad_id])
    @contribution = @ad.contributions.build(user_id: current_user.id, amount: params[:contribution][:amount])
    if @contribution.save
      redirect_to @contribution, :notice => "Successfully created contribution."
    else
      render :action => 'new'
    end
  end

  def update
    @contribution = Contribution.find(params[:id])
    if @contribution.update_attributes(params[:contribution])
      redirect_to @contribution, :notice  => "Successfully updated contribution."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    redirect_to contributions_url, :notice => "Successfully destroyed contribution."
  end
end
