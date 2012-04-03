class Author < ActiveRecord::Base
  include Gravtastic


  validates :name,     :presence => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
  # Default:
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  # Remove Registerable because we don't want random users registering
  devise :database_authenticatable, :recoverable, :rememberable,
        :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  attr_accessor :login

  has_gravatar


  def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   login = conditions.delete(:login)
   where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
  end
end
