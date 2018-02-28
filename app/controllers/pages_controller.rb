class PagesController < ApplicationController
  def index
    @jobs = if params[:search]
      Job.where('UPPER(company) LIKE UPPER(:search) OR UPPER(position) LIKE UPPER(:search) OR UPPER(location) LIKE UPPER(:search)', search: "%#{params[:search]}%")
    else
      Job.all
    end
    @newPosts = Post.new
    session[:return_to] = request.fullpath
  end

  def home
    @newPosts = Post.new
    @myRankings = Ranking.all.where("user_id = ?", current_user.id)
    session[:return_to] = request.fullpath
  end

  def explore
    @jobs = Job.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    @newPosts = Post.new
    session[:return_to] = request.fullpath
  end

  def help
  end

  def profile
  	if (User.find_by_username(params[:id]))
  		@username = params[:id]
  	else
  		redirect_to root_path, :notice => "User not found!"
  	end

  	@posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]))
    @rankings = Ranking.all.where("user_id = ?", User.find_by_username(params[:id]))
    @newPosts = Post.new
    session[:return_to] = request.fullpath
  end

  def terms_and_conditions
  end
end
