class RemoveColumnFromCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :open_time
    remove_column :companies, :closing_time
  end
end
