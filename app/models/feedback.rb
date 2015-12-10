class Feedback < ActiveRecord::Base
  belongs_to :user

  def journey
    target.journey
  end
end