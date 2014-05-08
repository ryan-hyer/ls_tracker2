json.array!(@clients) do |client|
  json.extract! client, :id, :name, :address, :phone, :website, :poc_name, :poc_title, :poc_phone, :poc_email, :invoice_amt, :invoice_freq, :invoice_month, :listing_number, :effective, :updated, :expires, :suspended, :delisted, :comments
  json.url client_url(client, format: :json)
end
