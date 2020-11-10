class ChangeColumnNameCompanies < ActiveRecord::Migration[6.0]
  def change
    rename_column :companies, :appointment_time, :phone_number
    change_column :companies, :phone_number, :string
  end
end
