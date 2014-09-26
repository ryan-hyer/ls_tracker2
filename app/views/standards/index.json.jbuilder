json.array!(@standards) do |standard|
  json.extract! standard, :id, :number, :revision
  json.url standard_url(standard, format: :json)
end
