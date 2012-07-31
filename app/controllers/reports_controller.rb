class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.json
  def index
    #@reports = Report.order("platform_id ASC, game_id ASC, status_id ASC, resolution_id DESC, report_number DESC")
    #@reports = Report.order("status_id ASC, resolution_id ASC, updated_at DESC")
		@reports = Report.paginate(:page => params[:page], :per_page => 15).order('status_id ASC, resolution_id ASC, updated_at DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(params[:report])
		 
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        #format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.html { redirect_to action: "index" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

	def regression
		#@reports = Report.joins('INNER JOIN builds ON reports.game_id = builds.game_id')
		#@reports = Report.joins('INNER JOIN builds ON (reports.game_id = builds.game_id) AND (reports.fix_commit = builds.commit)').where('reports.fix_commit <= builds.commit') 
		#@reports = Report.joins('LEFT JOIN builds ON reports.game_id = builds.game_id')
		#						.where('reports.status_id = 4 AND reports.resolution_id = 1 AND reports.fix_commit != \'\' AND reports.fix_commit <= builds.commit')
		#						.order("reports.platform_id, reports.game_id, reports.user_id ASC, reports.report_number DESC")
		@reports = Report.joins('RIGHT JOIN Builds B on reports.game_id = B.id').joins('JOIN Platforms P on reports.platform_id = P.id')
								.where('(reports.fix_commit != \'\' or reports.fix_commit != NULL) AND reports.fix_commit <= B.commit')
  	respond_to do |format|
  		format.html # regression.html.erb
  		format.json { render json: @reports }
		end
	end

	def search
		@reports = Report.find(:first, :conditions => [ "reports.report_key LIKE \'#{params[:report_search]}\'"])
		@report = Report.new
		respond_to do |format|
			format.html
		end
	end
end
