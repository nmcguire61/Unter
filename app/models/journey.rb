class Journey < ActiveRecord::Base
  belongs_to :user
  has_one :driver
  has_one :car, through: :driver
  has_many :passangers
end
