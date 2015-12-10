class PaymentTransaction < ActiveRecord::Base
  belongs_to :journey
  has_many :passengers, through: :journey
end
