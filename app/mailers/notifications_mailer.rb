class NotificationsMailer < ActionMailer::Base

  default :from => "web@icodeforu.com"
  default :to => "greg@icodeforu.com"

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.subject}")
  end

end