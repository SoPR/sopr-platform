class User < ActiveRecord::Base
  has_many :startups

  include Concerns::Gravatar

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

  private

  def welcome_message
    UserMailer.welcome_email(self).deliver
  end

  # Public Activity
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

end
