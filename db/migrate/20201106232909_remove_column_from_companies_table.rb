class RemoveColumnFromCompaniesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :animal_id
    add_column :animals, :user_id, :integer
  end
end
