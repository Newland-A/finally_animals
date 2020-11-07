class User < ApplicationRecord

  has_many :owners, class_name: "User", foreign_key: "vet_id"
  belongs_to :vet, class_name: "User", optional: true
 
  has_many :animals

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates_length_of :password, minimum: 8, if: Proc.new { | user | user.password.present? }

  def full_name
    "#{self.first_name}" + " #{self.last_name.capitalize}"
  end

end
