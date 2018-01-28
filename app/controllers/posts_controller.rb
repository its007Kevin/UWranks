class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to session[:return_to]
    session[:return_to] = nil
	end

	private
  	def post_params 
  		params.require(:post).permit(:user_id, :content)
  	end
end