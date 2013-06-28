class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login, :full_name
  validates_presence_of :username, :full_name
  validates_uniqueness_of :username

  before_save :create_full_name

  def full_name
    [first_name, last_name].join(' ')
  end

  def create_full_name
    puts instance_variables
    puts @attributes
    puts @changed_attributes
    split = self.full_name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
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
