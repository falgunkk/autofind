class MechanicMailer < ApplicationMailer
  def welcome_email
    @user = 'test user'
    @url  = 'http://repair.com/login'
    mail(to: 'falgunbalachandran@gmail.com', subject: 'I need your help Mr Mechanic')
  end
end
