class Animal < ApplicationRecord
  has_many :companies
  has_many :users, through: :companies
  accepts_nested_attributes_for :companies

  def companies_attributes=(company_attrs)
    company_attrs.values.each do |animal_attr|
      if company_attrs("location").present?
        company = Company.find_or_create_by(animal_attr)
        self.animals << company
      end
    end
  end

end
