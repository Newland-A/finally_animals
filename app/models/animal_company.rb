class AnimalCompany < ApplicationRecord
  # has_many :companies
  # has_many :animals through: :companies
  # has_many :animals
  # has_many :companies through: :animals
  belongs_to :animal
  belongs_to :company

end
