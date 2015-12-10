class DriverFeedback < Feedback
  belongs_to :target, class_name: 'Driver'
end