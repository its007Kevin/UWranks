class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save

		@postRankings = @post.job.rankings
	    @postRankings.each do |postRanking| 
	      if postRanking.user != current_user	
	        Notification.create(recipient: postRanking.user, actor: current_user, action: "commented on your ranking for " + @post.job.company + ", Job ID - " + @post.job.jobId, notifiable: @post)
	  	  	SendEmailJob.set(wait: 20.seconds).perform_later(postRanking.user, postRanking)
	  	  end
	    end

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
