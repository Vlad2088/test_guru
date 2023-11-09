class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <#{ENV['SMTP_USER']}>)
  layout 'mailer'
end
