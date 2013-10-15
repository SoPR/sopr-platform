json.array!(@events) do |event|
  json.extract! event, :name, :place, :date, :image, :url
  json.url event_url(event, format: :json)
end
