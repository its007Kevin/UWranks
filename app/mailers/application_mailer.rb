class ApplicationMailer < ActionMailer::Base
	default from: "uwranks@gmail.com"

	def comment_email(user, postRanking)
    @user = user
    @postRanking = postRanking
    @email = @user.username + "@edu.uwaterloo.ca"
    mail(to: @email, subject: 'Someone Commented on your Post!')
    #mail(to: 's29zeng@edu.uwaterloo.ca', subject: 'UWranks - Someone Commented on your Post!')
    #mail(to: 'ewang1242@gmail.com', subject: 'UWranks - Someone Commented on your Post!')
  end

  def ranking_email(user, postRanking)
  	@user = user
  	@postRanking = postRanking
  	@email = @user.username + "@edu.uwaterloo.ca"
  	mail(to: @email, subject: 'Another User has Ranked a Job You\'re Interested In!!')
  	#mail(to: 'kevinzeng98@gmail.com', subject: 'Another User Ranked a Job You\'re Interested In!')
  end

end
