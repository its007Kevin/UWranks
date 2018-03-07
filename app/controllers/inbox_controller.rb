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
      @users = Conversation.where("recipient_id = ? OR sender_id = ?", current_user.id, current_user.id) #and the length of its messages is not 0
      #@users = User.all.where.not(id: current_user)
    end



  end
end