class InboxController < ApplicationController
  def index
    session[:conversations] ||= []

    # @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])


    @users = if params[:user]
    User.where('username LIKE ?', "%#{params[:user]}%")
  else
    User.all.where.not(id: current_user)
  end

  end
end