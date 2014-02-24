class ReservationsWorker
  require Sidekiq::Worker

  def perform(res_id)
    reservation = Reservation.find(res_id)
    
  end
end