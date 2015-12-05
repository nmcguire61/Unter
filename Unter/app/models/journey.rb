class Journey < ActiveRecord::Base
  belongs_to :user
  has_one :car, :through => :user
  has_many :passangers
end
