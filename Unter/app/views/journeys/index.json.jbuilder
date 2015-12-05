json.array!(@journeys) do |journey|
  json.extract! journey, :id, :starting_point, :ending_point, :starting_time, :user_id, :status
  json.url journey_url(journey, format: :json)
end
