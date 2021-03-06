class Company < ApplicationRecord
  has_many :opening_hours
  has_many :animal_companies
  has_many :animals, through: :animal_companies

  def open?
    opening_hours.where("? BETWEEN opens AND closes", Time.zone.now).any?
  end
  
end
