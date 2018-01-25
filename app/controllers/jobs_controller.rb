class JobsController < ApplicationController
  def index 
    @search = Job.ransack(params[:q])
    if params[:q].nil?
      @emptyQuery = true
    else
      @emptyQuery = false
    end
    @results = @search.result
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      redirect_to "", :notice => "Job was not saved"
    end
  end

  private
    def job_params
      params.require(:job).permit(:jobId, :company, :position, :location, :search)
    end
end
