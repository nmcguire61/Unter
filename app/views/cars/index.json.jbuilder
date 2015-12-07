json.array!(@cars) do |car|
  json.extract! car, :id, :type, :seats, :user_id
  json.url car_url(car, format: :json)
end
