class Animal < ApplicationRecord
  has_many :companies
  has_many :users, through: :companies
  accepts_nested_attributes_for :companies

  def companies_attributes=(company_attrs)
    company_attrs.values.each do |animal_attr|
      if company_attrs("location").present?
        company = Company.find_or_create_by(animal_attr)
        self.animals << 

  def categories_attributes=(cats_attrs)
    cats_attrs.values.each do |cat_attr|
      if cat_attr["name"].present?
        category = Category.find_or_create_by(cat_attr)
        self.categories << category
      end
    end
  end


end
