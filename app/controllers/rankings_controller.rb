class RankingsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @ranking = Ranking.new(ranking_params_create)
    @ranking.save
    @ranking.job.rankings.each do |jobRanking|
      if jobRanking.user != current_user
        ApplicationMailer.ranking_email(jobRanking.user, jobRanking).deliver
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    @ranking = Ranking.find(params[:id])
  end

  def update
    @ranking = Ranking.find(params[:id])
    @ranking.update(ranking_params_update)
    respond_to do |format|
      format.js
    end
  end


  def destroy
    @ranking = Ranking.find(params[:id])
    @ranking.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    def ranking_params_create
      params.permit(:employerRank, :yourRank, :user_id, :job_id)
    end

    def ranking_params_update
      params.require(:ranking).permit(:employerRank, :yourRank, :user_id, :job_id)
    end
end
