class ApplicationMailer < ActionMailer::Base
	default from: "uwranks@gmail.com"

	def sample_email(user, postRanking)
    @user = user
    @postRanking = postRanking
    @email = @user.username + "@edu.uwaterloo.ca"
    mail(to: @email, subject: 'UWranks - Someone Commented on your Post!')
    #mail(to: 's29zeng@edu.uwaterloo.ca', subject: 'UWranks - Someone Commented on your Post!')
    #mail(to: 'ewang1242@gmail.com', subject: 'UWranks - Someone Commented on your Post!')
  end
end
