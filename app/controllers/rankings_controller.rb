class RankingsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @ranking = Ranking.new(ranking_params)
    @ranking.save
    redirect_to session[:return_to]
    session[:return_to] = nil
  end

  private
    def ranking_params
      params.permit(:employerRank, :yourRank, :user_id, :job_id)
    end
end
