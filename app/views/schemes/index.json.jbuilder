json.array!(@schemes) do |scheme|
  json.extract! scheme, :id, :name
  json.url scheme_url(scheme, format: :json)
end
