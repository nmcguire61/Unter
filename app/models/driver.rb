class Driver < ActiveRecord::Base
  belongs_to :journey
  belongs_to :user
  has_one :car, through: :user
end
