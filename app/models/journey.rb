class Journey < ActiveRecord::Base
  belongs_to :user
  has_one :driver
  has_one :car, through: :driver
  has_many :passengers

  acts_as_messageable

def full?
   self.passengers.to_a.count{|p| p.status == "Accepted"} == self.car.seats 
end

def mailboxer_email(object)

    if object.class==Mailboxer::Notification
      return nil
    else
      email
    end
end

end
