class PagesController < ApplicationController

   def index
      @posts = if params[:search]
        Post.where('content LIKE ?', "%#{params[:search]}%")
      else
        Post.all
      end
  end

  def login
  end

  def home
  	@posts = Post.all
    @newPosts = Post.new
    session[:return_to] = request.fullpath
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

  def explore
  	@posts = Post.all
  end
end
