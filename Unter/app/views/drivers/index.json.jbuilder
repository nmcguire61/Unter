json.array!(@drivers) do |driver|
  json.extract! driver, :id, :user_id, :journey_id, :status, :price
  json.url driver_url(driver, format: :json)
end
