class ReservationMailer < ActionMailer::Base
  default from: "eatwithseat@gmail.com"


  def reservation_confirmation(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Thanks for booking with Seat')
  end

  def reservation_update_confirmation(user_id, res_id)
    @user = User.find(user_id)
    @reservation = @user.reservations.find(res_id)
    mail(to: @user.email, subject: "Concerning your recent reservation updates")
  end

end
