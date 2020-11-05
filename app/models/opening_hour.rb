class OpeningHour < ApplicationRecord
  belongs_to :company

  validates_presence_of :day, :closes, :opens, :company_id
  validates_inclusion_of :day, :in => 1..7
  validate :opens_before_closes 
  validate :valid_from_before_valid_through 

  def opens_before_closes
    errors.add(:closes, I18n.t('errors.opens_before_closes')) if opens && closes && opens >= closes
  end

  def valid_from_before_valid_through
    errors.add(:valid_through, I18n.t('errors.valid_from_before_valid_through')) if valid_from && valid_through && valid_from >= valid_through
  end

end
