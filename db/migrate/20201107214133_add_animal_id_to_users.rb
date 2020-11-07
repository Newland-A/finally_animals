class AddAnimalIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :animal_id, :integer
  end
end
