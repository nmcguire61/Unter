class Car < ActiveRecord::Base
  belongs_to :user
  belongs_to :journey
end
