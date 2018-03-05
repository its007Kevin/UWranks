class SessionsController < Devise::SessionsController

  before_action CASClient::Frameworks::Rails::Filter

  def new
    super
  end

  def create
  end
end