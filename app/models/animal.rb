class Animal < ApplicationRecord
  has_many :animal_companies
  has_many :companies, through: :animal_companies

  validates_presence_of :name, :gender, :species

  belongs_to :user

  scope :male_animals, -> { where(gender: 'Male') }
  scope :female_animals, -> { where(gender: 'Female') }

  def companies_attributes=(company_params)
    company_params.values.each do |company_attrs|
      if company_attrs("location").present?
        company = Company.find_or_create_by(company_attrs)
        self.animals << company
      end
    end
  end

end
