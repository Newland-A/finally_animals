class User < ApplicationRecord

  has_many :owners, class_name: "User", foreign_key: "vet_id"
  belongs_to :vet, class_name: "User", optional: true
  has_many :companies
  has_many :animals, through: :companies
  accepts_nested_attributes_for :companies
  # accepts_nested_attributes_for :vet_id
  
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true

  validates_length_of :password, minimum: 8, if: Proc.new { | user | user.password.present? }

  def full_name
    "#{self.first_name}" + " #{self.last_name.capitalize}"
  end
end
