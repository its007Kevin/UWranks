class PagesController < ApplicationController
  def index
    @num_rankings = Ranking.where("user_id = ?", current_user.id).count  
    redirect_to :redirect if @num_rankings == 0
    @jobs = if params[:search]
      Job.includes({rankings: :user}, {posts: {comments: :user}}).where('"jobId" LIKE UPPER(:search) OR UPPER(company) LIKE UPPER(:search) OR UPPER(position) LIKE UPPER(:search) OR UPPER(location) LIKE UPPER(:search)', :search => "%#{params[:search]}%").order('company ASC').paginate(page: params[:page], per_page: 10).order('created_at DESC')
    else
      Job.includes({rankings: :user}, {posts: {comments: :user}}).order('company ASC')
    end
    @newPosts = Post.new
    respond_to do |format|
      format.js
      format.html
    end
    session[:return_to] = request.fullpath
  end

  def home
    @cas_user = session[:cas_user] # holds questID
    @newPosts = Post.new
    @myRankings = Ranking.includes(job: [{rankings: :user}, {posts: {comments: :user}}]).where("user_id = ?", current_user.id)
    session[:return_to] = request.fullpath
  end

  def explore
    @num_rankings = Ranking.where("user_id = ?", current_user.id).count  
    redirect_to :redirect if @num_rankings == 0
    @jobs = Job.includes({rankings: :user}, {posts: {comments: :user}}).paginate(page: params[:page], per_page: 10).order('updated_at DESC')
    @newPosts = Post.new    
    respond_to do |format|
      format.js
      format.html
    end
    session[:return_to] = request.fullpath
  end

  def landing
    redirect_to :home if user_signed_in? 
  end

  def autocompleteJobs
    @jobs = Job.where('UPPER(company) LIKE UPPER(:search)', :search => "#{params[:term]}%").select("DISTINCT(company)").limit(10)
    render json: @jobs.map(&:company)
  end

  def autocompleteLocation
    @locations = Job.where('UPPER(location) LIKE UPPER(:search)', :search => "#{params[:term]}%").select("DISTINCT(location)").limit(5)
    render json: @locations.map(&:location)
  end

  def autocompletePosition
    @positions = Job.where('UPPER(position) LIKE UPPER(:search)', :search => "#{params[:term]}%").select("DISTINCT(position)").limit(5)
    render json: @positions.map(&:position)
  end
end
