class BuildsController < ApplicationController
  # GET /builds
  # GET /builds.json
  def index
		@builds = build_type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @builds }
    end
  end

  # GET /builds/latest
  def current
		@builds = GooglePlay.select("DISTINCT(game_id), builds.*").all

    respond_to do |format|
      format.html # latest.html.erb
      format.json { render json: @builds }
    end
  end

  # GET /builds/1
  # GET /builds/1.json
  def show
    @build = build_type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @build }
    end
  end

  # GET /builds/new
  # GET /builds/new.json
  def new
    @build = build_type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @build }
    end
  end

	def build_type
		params[:type].constantize
	end

  # GET /builds/1/edit
  def edit
    @build = build_type.find(params[:id])
  end

  # POST /builds
  # POST /builds.json
  def create
		type = params[:type].underscore
    @build = build_type.new(params[type.to_s])
    respond_to do |format|
      if @build.save
        format.html { redirect_to @build, notice: 'Build was successfully created.' }
        format.json { render json: @build, status: :created, location: @build }
      else
        format.html { render action: "new" }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /builds/1
  # PUT /builds/1.json
  def update
    @build = build_type.find(params[:id])

    respond_to do |format|
      if @build.update_attributes(params[:build])
        format.html { redirect_to @build, notice: 'Build was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builds/1
  # DELETE /builds/1.json
  def destroy
    @build = build_type.find(params[:id])
    @build.destroy

    respond_to do |format|
      format.html { redirect_to builds_url }
      format.json { head :no_content }
    end
  end
end
