json.array!(@passengers) do |passenger|
  json.extract! passenger, :id, :user_id, :journey_id, :status, :price
  json.url passenger_url(passenger, format: :json)
end
