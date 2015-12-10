class Journey < ActiveRecord::Base
  belongs_to :user
  has_one :driver
  has_one :car, through: :driver
  has_many :passengers

  acts_as_messageable



  def human_readable_date
    journey_date.strftime('%A %B %d %Y')
  end

  def human_readable_time
    starting_time.strftime('%A %B %d %Y, %H:%M')
  end

def full?
   self.passengers.to_a.count{|p| p.status == "Accepted"} == self.car.seats 
end

def sum_passenger_price
  self.passengers.inject(0) {|sum, passenger| sum + passenger.price.to_f}
  #rating_sum = feedback.inject(0) {|sum, feedback| sum + feedback.rating.to_f}

end


def mailboxer_email(object)

    if object.class==Mailboxer::Notification
      return nil
    else
      email
    end
end

end
