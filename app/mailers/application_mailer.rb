class ApplicationMailer < ActionMailer::Base
	default from: "uwranks@gmail.com"

	def comment_email(user, postRanking)
    @user = user
    @postRanking = postRanking
    @email = @user.username + "@edu.uwaterloo.ca"
    mail(to: @email, subject: 'Someone Commented on your Post!')
  end

  def ranking_email(user, postRanking)
  	@user = user
  	@postRanking = postRanking
  	@email = @user.username + "@edu.uwaterloo.ca"
  	mail(to: @email, subject: 'Another User has Ranked a Job You\'re Interested In!!')
  end

end
