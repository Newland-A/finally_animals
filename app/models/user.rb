class User < ApplicationRecord

  has_many :owners, class_name: "User", foreign_key: "vet_id"
  belongs_to :vet, class_name: "User"
  has_many :companies
  has_many :animals, through: :companies

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true

  validates_length_of :password, minimum: 8, if: Proc.new { | user | user.password.present? }

end
