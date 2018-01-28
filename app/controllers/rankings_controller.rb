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
    redirect_to session[:return_to]
    session[:return_to] = nil
  end

  def edit
    @ranking = Ranking.find(params[:id])
  end

  def update
    @ranking = Ranking.find(params[:id])
    @ranking.update(ranking_params_update)
    redirect_to session[:return_to]
    session[:return_to] = nil
  end


  def destroy
    @ranking = Ranking.find(params[:id])
    @ranking.destroy
    redirect_to session[:return_to]
    session[:return_to] = nil
  end

  private
    def ranking_params_create
      params.permit(:employerRank, :yourRank, :user_id, :job_id)
    end

    def ranking_params_update
      params.require(:ranking).permit(:employerRank, :yourRank, :user_id, :job_id)
    end
end
