class User < ActiveRecord::Base
  has_many :startups
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login
  validates_presence_of :username, :full_name
  validates_uniqueness_of :username
  validates_length_of :bio, :maximum => 120

  def full_name
    [first_name, last_name].join(' ') if first_name && last_name
  end

  def full_name=(name='')
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
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

end
