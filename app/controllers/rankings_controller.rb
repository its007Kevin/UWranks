class RankingsController < ApplicationController
  def new
    @ranking = Ranking.new
    @rankings = Ranking.all
  end

  def create
    @ranking = Ranking.new(ranking_params)
    @ranking.save
    redirect_to new_ranking_path
  end

  private
    def ranking_params
      params.require(:ranking).permit(:employerRank, :yourRank, :user_id, :job_id)
    end
end
