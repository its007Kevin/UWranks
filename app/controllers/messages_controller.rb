class MessagesController < ApplicationController
  def index


    @conversation = Conversation.get(current_user.id, params[:user_id])

  end
end