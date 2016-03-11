class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.thank_you.subject
  #
  def thank_you(user)
    @user = user
    @greeting = "Hi"

    mail to: "to@example.org", subject: "Thanks!"
  end
end
