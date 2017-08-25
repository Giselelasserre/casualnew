class ApplicationMailer < ActionMailer::Base
  default from: 'confirmation-email@casual.com'

  layout 'mailer'
end
