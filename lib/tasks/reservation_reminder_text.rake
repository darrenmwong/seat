desc "Texts users who have upcoming reservations"
  # Set the custom rake up for scanning reservations.
  task :text_users => :environment do
    # Ceate the deadline date check_date
    check_date = DateTime.now.to_date + 1.day
    # Gather and sort all reservations
    Reservation.all.sort.each do |res|
      
      # finding the user, and passing those parameters (ActiveRecord Objects) 
      # to twilioText which then performs the necessary actions
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
      :body => "This is just a friendly reminder that you have a reservation at #{res.restaurant.name} on #{l(res.begin, format: :default)} for #{res.party_size}.  We can't wait to see you.",
      :to => "#{user.phone_number}",
      :from => ENV['TWILIO_PHONE']) 

    end
  end


# First round draft at attaching Twilio.
# >using my account means texts will be sent from a 412 area-code...

# A test will require us to sync up data and then create an appointment for 1 day from current (DateTime.now.day) 
# and then run the custom rake.  I think we can do `heroku run rake <rake_name>` or we can just do `rake <rake_name>` from Rails Console.  
# I'm going to investigate after updating.

# After copious testing will I finish setting up Heroku Scheduler (already deployed) to run as necessary.