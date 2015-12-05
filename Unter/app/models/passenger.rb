class Passenger < ActiveRecord::Base
  belongs_to :journey
  belongs_to :user
end
