json.array!(@facilities) do |facility|
  json.extract! facility, :id, :client_id, :name, :address, :phone, :poc_name, :poc_phone, :poc_email, :inactive, :comments
  json.url facility_url(facility, format: :json)
end
