class PaymentTransaction < ActiveRecord::Base
  belongs_to :journey
end
