class UserMailer < ActionMailer::Base
  default from: 'noreturn@example.com'

  def test_email(email)
    mail(
      to: email,
      subject: 'Testing Active Job Mailer'
    )
  end
end
