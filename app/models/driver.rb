class Driver < ActiveRecord::Base
  belongs_to :journey
  belongs_to :user
  has_one :car, through: :user
  has_many :driver_feedbacks, foreign_key: :target_id
end
