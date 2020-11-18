class Animal < ApplicationRecord
  has_many :animal_companies
  has_many :companies, through: :animal_companies

  validates_presence_of :name, :age, :gender, message: "Name, Age, Gender, Approximate weight, Species, Breed and Any Medical information must be provided"

  belongs_to :user

  def companies_attributes=(company_params)
    company_params.values.each do |company_attrs|
      if company_attrs("location").present?
        company = Company.find_or_create_by(company_attrs)
        self.animals << company
      end
    end
  end

end
