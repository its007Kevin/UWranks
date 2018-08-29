class JobsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def index
    @rankings = Ranking.includes(:job).where("user_id = ?", current_user.id)
    @search = Job.ransack(params[:q])
    if params[:q] && params[:q].values.reject(&:blank?).any?
      @emptyQuery = false
      @jobs = @search.result
    else
      @emptyQuery = true
    end
  end

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @job = Job.new(job_params)
    @job.save
    respond_to do |format|
      format.js
    end
  end

  def edit
    @job = Job.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params_update)
    respond_to do |format|
      format.js
    end
  end

  private
    def job_params
      params.permit(:jobId, :company, :position, :location, :job_search, :openings)
    end

    def job_params_update
      params.require(:job).permit(:jobId, :company, :position, :location, :job_search, :openings)
    end
end
