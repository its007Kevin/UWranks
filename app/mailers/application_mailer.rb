class ApplicationMailer < ActionMailer::Base
	default from: "uwranks123@gmail.com"

	def sample_email(user)
    @user = user
    #mail(to: @user.email, subject: 'Sample Email')
    mail(to: 'ewang1242@gmail.com', subject: 'UWranks Email Test')
  end
end
