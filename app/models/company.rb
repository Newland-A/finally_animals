class Company < ApplicationRecord
  has_many :opening_hours
  belongs_to :animal
  belongs_to :user

  def open?
    opening_hours.where("? BETWEEN opens AND closes", Time.zone.now).any?
  end
  
end
