class Passenger < ActiveRecord::Base
  belongs_to :journey
  belongs_to :user
  has_many :passenger_feedbacks, foreign_key: :target_id
end
