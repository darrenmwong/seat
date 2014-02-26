class ReservationMailer < ActionMailer::Base
  default from: "eatwithseat@gmail.com"

  def reservation_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Thanks for booking with Seat')
  end
end
