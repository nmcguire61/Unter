json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :type, :seats, :user_id
  json.url transaction_url(transaction, format: :json)
end