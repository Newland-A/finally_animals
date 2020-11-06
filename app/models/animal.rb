class Animal < ApplicationRecord
  has_many :companies
  has_many :users, through: :companies
  
end
