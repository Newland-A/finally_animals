class Animal < ApplicationRecord
  has_many :animal_companies
  has_many :companies, through: :animal_companies

  belongs_to :user

  def companies_attributes=(company_params)
    binding.pry
    company_params.values.each do |company_attrs|
      if company_attrs("location").present?
        company = Company.find_or_create_by(company_attrs)
        self.animals << company
      end
    end
  end

  def altered=(altered)
    altered.reject(&:blank?)
  end
end
