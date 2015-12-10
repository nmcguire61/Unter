json.array!(@payment_transactions) do |payment_transaction|
  json.extract! payment_transaction, :id, :type, :seats, :user_id
  json.url payment_transaction_url(payment_transaction, format: :json)
end