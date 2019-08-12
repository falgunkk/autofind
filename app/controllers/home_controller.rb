class HomeController < ApplicationController

  def index; end

  def send_email_to_mechanic
    # https://guides.rubyonrails.org/action_mailer_basics.html
    MechanicMailer.welcome_email.deliver!
    return { success: true }
  end
end
