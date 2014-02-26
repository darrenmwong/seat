desc "Texts users who have upcoming reservations"
  
  task :text_users => :environment do
    
    check_date = DateTime.now.to_date + 1.day

    Reservation.all.sort.each do |res|
      
      if res.begin.to_date == check_date
        user = res.user
        twilioText(user,res)
      end
      
    end

    def twilioText(user,res)

    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      :body => "This is just a friendly reminder that you have a reservation at #{res.restaurant.name} on #{l(res.begin), format: :default)} for #{res.party_size}.  We can't wait to see you.",
      :to => "#{user.phone_number}",
      :from => ENV['TWILIO_PHONE']) 

    end
  end


