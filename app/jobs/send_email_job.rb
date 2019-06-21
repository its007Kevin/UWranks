class SendEmailJob < ActiveJob::Base
  # queue_as :default

  def perform(user, postRanking)
  	@user = user
    @postRanking = postRanking
    # ApplicationMailer.ranking_email(@user, @postRanking).deliver_later
  end
end
