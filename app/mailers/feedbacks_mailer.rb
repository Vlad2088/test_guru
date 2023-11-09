class FeedbacksMailer < ApplicationMailer

  def feedback(email, name, message)
    @email = email
    @name = name
    @message = message

    mail to: ENV['ADMIN_EMAIL']
  end
end
