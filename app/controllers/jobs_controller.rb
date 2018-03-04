class JobsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @rankings = Ranking.all.where("user_id = ?", current_user.id)
    @search = Job.ransack(params[:q])
    if params[:q].nil?
      @emptyQuery = true
    else
      @emptyQuery = false
    end
    @jobs = @search.result
    session[:return_to] = request.fullpath
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

  private
    def job_params
      params.permit(:jobId, :company, :position, :location, :job_search)
    end
end
