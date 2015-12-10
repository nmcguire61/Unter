class PassengerFeedback < Feedback
  belongs_to :target, class_name: 'Passenger'
end