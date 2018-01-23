class JobsController < ApplicationController
  def new
    @jobs = Job.all
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save
    redirect_to new_job_path
  end

  private
    def job_params
      params.require(:job).permit(:jobId, :company, :position, :location, :search)
    end
end
