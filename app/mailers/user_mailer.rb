class UserMailer < ActionMailer::Base
  default from: ENV['SMTP_USERNAME'] || 'sopr@example.com'

  def welcome_email(user)
    @user = user
    attachments.inline['logo.png'] = File.read("#{Rails.root}/app/assets/images/logo.png")
    mail(to: @user.email, subject: 'Welcome to Startups of Puerto Rico')
  end
end
