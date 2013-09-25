class User < ActiveRecord::Base
  has_many :startups
  has_many :events

  include Concerns::Gravatar
  include PgSearch

  scope :hirable, ->(hirable_flag) {where(available_for_hire: hirable_flag) if hirable_flag}
  scope :filter_by_roles, ->(role_flags) {where(role: role_flags) unless role_flags.empty?}
  scope :filter_by_bio, ->(keyword_filter) {_filter_by_bio(keyword_filter) unless keyword_filter.empty?}

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessor :login
  validates_presence_of :username, :full_name
  validates_uniqueness_of :username
  validates_length_of :bio, :maximum => 120

  def full_name
    [first_name, last_name].join(' ') if first_name && last_name
  end

  def full_name=(name='')
    self.first_name, self.last_name = name.split(' ', 2)
  end

  def self.roles
    %w(developer designer hacker entrepreneur artist business).map do |role|
      [role.titlecase, role]
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def confirm!
    welcome_message
    super
  end

  def self.search(search_query)
    # Return an ActiveRecord::Relation with Users that meet the search query.
    #
    # TODO: Review for security

    keyword_filter = search_query.nil? ? '' : String.new(cleanup_keywords(search_query))
    hirable_filter, roles_filter, keywords_filter  = process_search(keyword_filter)

    User.hirable(hirable_filter).filter_by_roles(roles_filter).filter_by_bio(keywords_filter)
  end

  private 
  
  def self.cleanup_keywords(args)
    args.split(' ').map { |arg| arg.downcase }.join(' ')
  end

  def self.process_search(keywords)
    hirable, keywords_filtered          = process_hirable(keywords)
    roles_filtered, keywords_refiltered = process_roles(keywords_filtered)

    [hirable, roles_filtered, keywords_refiltered.strip]
  end

  def self.process_roles(keywords, roles_filtered = [])
    roles.map do |role|
      if /#{role.last}|is:#{role.last}/.match(keywords.singularize) != nil
        roles_filtered << role.last
        keywords.slice!(Regexp.last_match.to_s)
      end
    end
    [roles_filtered, keywords]
  end

  def self.process_hirable(keywords, hirable = false)
    if /hireable|hirable|hire|forhire|is:forhire/.match(keywords) != nil
      hirable = true
      keywords.slice!(Regexp.last_match.to_s)
    end
    [hirable, keywords]
  end

  def welcome_message
    UserMailer.welcome_email(self).deliver
  end

  # This scope is wrapped in a normal ActiveRecord scope in order to make it optional.
  pg_search_scope :_filter_by_bio,
                  :against => :bio,
                  :using => {
                    :tsearch => {any_word: true}
                  },
                  :ignoring => :accents

  # Public Activity
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

end
