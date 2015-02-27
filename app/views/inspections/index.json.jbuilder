json.array!(@inspections) do |inspection|
  json.extract! inspection, :id, :number, :inspection_date, :comments
  json.url inspection_url(inspection, format: :json)
end
