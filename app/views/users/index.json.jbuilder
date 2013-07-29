#users = @users.map do |user|
#  { user: user.full_name,
#    github: user.github_username,
#    twitter: user.twitter_username,
#    website: user.website_url,
#    available_for_hire: user.available_for_hire
#  }
#end
#
##users.select! do |k, v|
##  v.select! do |vv|
##    !vv.empty?
##  end
##  v.length > 0
##end
#
#users.delete_if { |k, v| v.nil? }

#json.array!(@startups) do |startup|
#  json.extract! startup, :name, :pitch, :website, :product, :location, :markets, :user_id
#  json.url startup_url(startup, format: :json)
#end


json.array!(@users) do |user|
  json.extract! user, :full_name, :github_username, :twitter_username, :website_url, :available_for_hire
  json.url user_url(user, format: :json)
end
