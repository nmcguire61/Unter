class Journey < ActiveRecord::Base
  belongs_to :user
  has_one :driver
  has_one :car, through: :driver
  has_many :passengers

def full?
   self.passengers.count{|p| p.status == "Accepted"} == self.car.seats 
end

end
