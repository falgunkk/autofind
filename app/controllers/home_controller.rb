class HomeController < ApplicationController
  def index; end

  def send_email_to_mechanic
    # https://guides.rubyonrails.org/action_mailer_basics.html
    MechanicMailer.welcome_email.deliver!
    return { success: true }
  end
  def set_active_job
  	# bundle exec rake resque:work QUE=* --- for runnig workers
    # bundle exec rake resque:scheduler --- for scheduling
    # EmailSendJob.new.perform # run without queue
    EmailSendJob.perform_later #add to queue
    return { success: true }
  end
end
