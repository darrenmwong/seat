class ReservationMailer < ActionMailer::Base
  default from: "eatwithseat@gmail.com"

  def reservation_confirmation(user)
    @user = user
    @url  = 'http://0.0.0.0:3000.com/login'
    mail(to: @user.email, subject: 'Thanks for booking with Seat')
  end
end
