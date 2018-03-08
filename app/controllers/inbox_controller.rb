class InboxController < ApplicationController
  def index
    session[:conversations] ||= []

    # @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])


    if params[:user]
      @users = User.where("username LIKE ? AND username != ?", "%#{params[:user]}%", current_user.username).order('username ASC')
    else
      @convos = Conversation.where("recipient_id = :id OR sender_id = :id", :id => current_user.id)
      @users = Array.new
      @convos.each do |convo|
        if (convo.messages.length() > 0)
          @users.push(convo.opposed_user(current_user))
        end
      end
      @users.sort_by {|user| user.username}
      #@users = User.all.where.not(id: current_user)
    end



  end
end