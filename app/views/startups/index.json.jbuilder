json.array!(@startups) do |startup|
  json.extract! startup, :name, :pitch, :website, :product, :market
  json.url startup_url(startup, format: :json)
end
