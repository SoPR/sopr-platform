module UsersHelper
  def gravatar_for(user, options = { size: 140})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    return "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
 end