json.array!(@users) do |user|
  json.extract! user, :id, :name, :rating_avg, :phone_number, :description, :avatar
  json.url user_url(user, format: :json)
end
