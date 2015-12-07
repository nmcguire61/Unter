json.array!(@feedback) do |feedback|
  json.extract! feedback, :id, :passenger_id, :comment, :rating
  json.url feedback_url(feedback, format: :json)
end