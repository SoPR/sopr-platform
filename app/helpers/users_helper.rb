module UsersHelper
  def gravatar_for(user, options = { size: 140})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    return "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
  def facebook_url(user)
    return "https://facebook.com/#{user.facebook_username}"
  end
  def twitter_url(user)
    return "https://twitter.com/#{user.twitter_username}"
  end
  def linkedin_url(user)
    return "http://www.linkedin.com/in/#{user.linkedin_username}"
  end
  def github_url(user)
    return "https://github.com/#{user.github_username}"
  end
  def flickr_url(user)
    return "http://www.flickr.com/people/#{user.flickr_username}/"
  end
  def dribbble_url(user)
    return "http://dribbble.com/#{user.dribbble_username}"
  end
end