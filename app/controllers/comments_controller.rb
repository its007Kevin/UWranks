class CommentsController < ApplicationController
  def create
    if user_signed_in? && current_user.banned?
      sign_out current_user
      flash[:error] = "Your account has been suspended. Please email uwranks@gmail.com for further assistance."
      root_path
    end

    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    @user = @post.user
    if @user != current_user
      Notification.create(recipient: @user, actor: current_user, action: "replied to your comment on your ranking for " + @post.job.company + ", Job ID - " + @post.job.jobId, notifiable: @comment)
    end


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
