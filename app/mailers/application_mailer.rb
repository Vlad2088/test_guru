class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <#{ENV["smtp_user"]}>)
  layout 'mailer'
end
