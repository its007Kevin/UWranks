class PagesController < ApplicationController
  def index
  end

  def home
  	@posts = Post.all
    @username = params[:id]
    @newPosts = Post.new
  end

  def profile
  	if (User.find_by_username(params[:id])) 
  		@username = params[:id]
  	else
  		redirect_to root_path, :notice => "User not found!"
  	end

  	@posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]))
    @newPosts = Post.new
  end

  def explore
  	@posts = Post.all
    @username = params[:id]
  end
end
