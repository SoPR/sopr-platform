json.array!(@startups) do |startup|
  json.extract! startup, :name, :pitch, :website, :product, :location, :markets, :user_id
  json.url startup_url(startup, format: :json)
end
