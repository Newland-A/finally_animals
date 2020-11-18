class User < ApplicationRecord

  has_many :owners, class_name: "User", foreign_key: "vet_id"
  belongs_to :vet, class_name: "User", optional: true
 
  has_many :animals, dependent: :destroy

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates_length_of :password, minimum: 8, if: Proc.new { | user | user.password.present? }

  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.id = User.last.id + 1
      u.email = auth[:info][:email]
      u.first_name = auth[:info][:first_name]
      u.last_name = auth[:info][:last_name]
      u.password = SecureRandom.hex
    end
  end

  def self.create_by_github_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
    u.id = User.last.id + 1
    u.email = auth[:info][:email]
    u.first_name = auth[:info][:first_name]
    u.last_name = auth[:info][:last_name]
    u.password = SecureRandom.hex
    end
  end

  def self.create_by_facebook_omniauth
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.id = User.last.id + 1
      u.email = auth[:info][:email]
      u.first_name = auth[:info][:first_name]
      u.last_name = auth[:info][:last_name]
      u.password = SecureRandom.hex
      end
  end
  
  def full_name
    "#{self.first_name.capitalize}" + " #{self.last_name.capitalize}"
  end

end
