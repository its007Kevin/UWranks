class JobsController < ApplicationController
  def index 
    @search = Job.ransack(params[:q])
    @results = @search.result
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save
    redirect_to jobs_path
  end

  private
    def job_params
      params.require(:job).permit(:jobId, :company, :position, :location, :search)
    end
end
