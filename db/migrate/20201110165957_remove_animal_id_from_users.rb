class RemoveAnimalIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :animal_id
  end
end
