module ReservationsHelper

  # The method that adds 1.5 hrs (5400 sec) to the begin time
  # for a reservation and then returns the end_time
  def end_time_calculator(begin_time)
    end_time = begin_time + 5400
    return end_time
  end

  def reservation_confirmation_email_send(user)
    ReservationMailer.reservation_confirmation(user).deliver
  end

end
