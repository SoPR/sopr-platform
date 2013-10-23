json.array!(@events) do |event|
  json.extract! event, :name, :place, :date, :image, :url, :user_id
  json.url event_url(event, format: :json)
end
