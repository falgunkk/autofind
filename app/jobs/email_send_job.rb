# https://guides.rubyonrails.org/active_job_basics.html/
class EmailSendJob < ActiveJob::Base
  # queue_as :default
  queue_as :high_priority
  def perform(*args)
    MechanicMailer.welcome_email.deliver_now!
  end
end
