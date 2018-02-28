class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    #To fill: 
    #recipient: person who should get the notification
    #actor: person who sent notification
    #notifiable: thing you want to link to when you click (not sure if you want to link to @comment or @post)
    #might want to notify everybody who is attached to the posts
    
    #Notification.create(recipient: recipient, actor: current.user_id, action: "commented", notifiable: @comment)

    respond_to do |format|
      format.html { redirect_to @post }
      format.js #render comments/create.js.erb
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
