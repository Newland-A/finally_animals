class Animal < ApplicationRecord
  has_many :companies
  has_many :users, through: :companies
  # accepts_nested_attributes_for :companies

  def companies_attributes=(company_params)
    binding.pry
    
    company_params.values.each do |company_attrs|
      if company_attrs("location").present?
        company = Company.find_or_create_by(company_attrs)
        self.animals << company
      end
    end
  end

end
