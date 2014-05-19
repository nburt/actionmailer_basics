class MeetingMailer < ActionMailer::Base

  default from: "meetings@example.com"

  def meeting_scheduled
    mail(to: "employees@example.com", subject: "A meeting has been scheduled!")
  end

end