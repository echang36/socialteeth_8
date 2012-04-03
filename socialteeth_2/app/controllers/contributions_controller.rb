class ContributionsController < ApplicationController
  # GET /contributions
  # GET /contributions.json
  def index
    @contributions = Contribution.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contributions }
    end
  end

  # GET /contributions/1
  # GET /contributions/1.json
  def show
    @contribution = Contribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contribution }
    end
  end

  # GET /contributions/new
  # GET /contributions/new.json
  def new
    @contribution = Contribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contribution }
    end
  end

  # GET /contributions/1/edit
  def edit
    @contribution = Contribution.find(params[:id])
  end

  # POST /contributions
  # POST /contributions.json
  def create
	contributer=User.find_by_email!(params[:contribution][:user])
	to_ad=Ad.find(params[:contribution][:ad])
    @contribution = Contribution.new(
		user: contributer,
		ad: to_ad,
		amount: params[:contribution][:amount])
	
	
    respond_to do |format|
     if @contribution.save
      format.html { redirect_to @contribution, notice: 'Contribution was successfully created.' }
        format.json { render json: @contribution, status: :created, location: @contribution }
      else
        format.html { render action: "new" }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contributions/1
  # PUT /contributions/1.json
  def update
    @contribution = Contribution.find(params[:id])

    respond_to do |format|
      if @contribution.update_attributes(params[:contribution])
        format.html { redirect_to @contribution, notice: 'Contribution was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributions/1
  # DELETE /contributions/1.json
  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy

    respond_to do |format|
      format.html { redirect_to contributions_url }
      format.json { head :ok }
    end
  end
end
