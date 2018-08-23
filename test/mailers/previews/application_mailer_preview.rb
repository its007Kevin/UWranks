# Preview all emails at http://localhost:3000/rails/mailers/application_mailer
class ApplicationMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    ApplicationMailer.sample_email(User.first)
  end
end
