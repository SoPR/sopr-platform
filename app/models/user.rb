class User < ActiveRecord::Base
  has_many :startups
  has_many :events

  include Concerns::Gravatar
  include PgSearch

  scope :hirable, ->(hirable_flag) {where(available_for_hire: true) unless hirable_flag.empty?}
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

  def self.search(search_query)
    # Return an ActiveRecord::Relation with Users that meet the search query.
    #
    # TODO: Ignore accents.
    #       Choose a more intuitive filter than 'is:forhire'
    #       Review for security
    #       Automated testing.
    #       README explaining how to test/use search in dev. Config files edited etc.

    keyword_filter = search_query.nil? ? '' : String.new(search_query)
    roles_filter = []
    hirable_filter = ''

    # Collect filters
    if /is:forhire/.match(keyword_filter) != nil
      hirable_filter = 'true'
      keyword_filter.slice!('is:forhire')
    end
    if /is:hacker/.match(keyword_filter) != nil
      roles_filter << 'hacker'
      keyword_filter.slice!('is:hacker')
    end
    if /is:developer/.match(keyword_filter) != nil
      roles_filter << 'developer'
      keyword_filter.slice!('is:developer')
    end
    if /is:designer/.match(keyword_filter) != nil
      roles_filter << 'designer'
      keyword_filter.slice!('is:designer')
    end
    if /is:entrepreneur/.match(keyword_filter) != nil
      roles_filter << 'entrepreneur'
      keyword_filter.slice!('is:entrepreneur')
    end
    if /is:artist/.match(keyword_filter) != nil
      roles_filter << 'artist'
      keyword_filter.slice!('is:artist')
    end
    if /is:business/.match(keyword_filter) != nil
      roles_filter << 'business'
      keyword_filter.slice!('is:business')
    end

    User.hirable(hirable_filter).filter_by_roles(roles_filter).filter_by_bio(keyword_filter)
  end

  def confirm!
    welcome_message
    super
  end

  private

  def welcome_message
    UserMailer.welcome_email(self).deliver
  end

  # This scope is wrapped in a normal ActiveRecord scope in order to make it optional.
  pg_search_scope :_filter_by_bio,
                  :against => :bio,
                  :using => {
                    :tsearch => {any_word: true}
                  }

  # Public Activity
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

end
