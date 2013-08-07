module Concerns::Gravatar
  # Provides methods for social data added through Gravatar's Verified Services
  extend ActiveSupport::Concern

  included do
    %w(facebook flickr twitter linkedin).map do |network_name|
      # Defines predicate methods when module is loaded
      #   Example:
      #     User.first.linkedin?
      #     => true
      #
      define_method "#{network_name}?" do
        account_names.include?(network_name)
      end

      # Defines dynamic getter methods when module is loaded
      #   Example:
      #     User.first.twitter
      #     => "JonahBinario"
      #
      define_method network_name do
        social_info.send(network_name) if send("#{network_name}?")
      end
    end

    after_validation :prefill_social_data, if: :new_record?
  end

  def prefill_social_data
    self.facebook_username = self.facebook if self.facebook?
    self.flickr_username   = self.flickr   if self.flickr?
    self.twitter_username  = self.twitter  if self.twitter?
    self.linkedin_username = self.linkedin if self.linkedin?
    self.bio               = self.about_me unless self.about_me.nil?
  end

  def gravatar_user_hash
     Digest::MD5::hexdigest(self.email.downcase)
  end

  # Returns an OpenStruct object with methods for each account found
  # This enables the methods defined in the included callback.
  # Can also be used like this:
  #     User.first.available_info
  #     => #<OpenStruct facebook="jose.a.padilla", linkedin="joseapadilla", twitter="jpadilla_">
  #
  #     User.first.available_info.twitter
  #     => "jpadilla_"
  #
  def social_info
    user_social_info = {}

    account_data.map do |account|
      user_social_info[account['shortname']] = account['username']
    end
    OpenStruct.new(user_social_info)
  end

  def about_me
    info.fetch('aboutMe', nil)
  end

  private

  def user_json
    begin
      entries = JSON.parse(open("http://en.gravatar.com/#{gravatar_user_hash}.json").read)
    rescue Exception => e
      entries = {}
    end
    entries
  end

  def info
    begin
      user_entry = user_json['entry'][0]
    rescue Exception => e
      user_entry = {}
    end
    user_entry
  end

  def account_data
    info['accounts'] || []
  end

  def account_names
    account_data.map { |a| a.fetch('shortname', nil) }
  end
end
