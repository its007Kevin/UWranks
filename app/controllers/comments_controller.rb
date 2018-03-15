class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    @user = @post.user
    Notification.create(recipient: @user, actor: current_user, action: "replied to your comment on your ranking for " + @post.job.company + ", Job ID - " + @post.job.jobId, notifiable: @comment)
  

    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to home_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
