json.array!(@events) do |event|
  json.extract! event, :name, :where, :start_time, :url, :image, :user_id
  json.url event_url(event, format: :json)
end
