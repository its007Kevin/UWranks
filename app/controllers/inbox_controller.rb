class InboxController < ApplicationController
  def index
    session[:conversations] ||= []

    # @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])

    @isSearch = false


    if params[:user]
      @isSearch = true
      @users = User.where("username LIKE ? AND username != ?", "%#{params[:user]}%", current_user.username)
    else
      @isSearch = false
      @convos = Conversation.where("recipient_id = :id OR sender_id = :id", :id => current_user.id) 
      @users = Array.new
      @convos.each do |convo|
        if (convo.messages.length() > 0)
          @users.push(convo)
        end
      end
      #@users = User.all.where.not(id: current_user)
    end



  end
end