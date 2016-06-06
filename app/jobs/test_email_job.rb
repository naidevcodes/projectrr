
class TestEmailJob < ActiveJob::Base
  queue_as :email

  def perform(email)
    UserMailer.test_email(email).deliver_now
  end
end