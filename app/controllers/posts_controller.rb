class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save

    respond_to do |format|
      format.html { redirect_to session[:return_to] }
      format.js
    end
	end

	private
  	def post_params
  		params.require(:post).permit(:user_id, :content, :job_id)
  	end
end
