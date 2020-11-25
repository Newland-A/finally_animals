class ChangeColumnTypeAnimals < ActiveRecord::Migration[6.0]
  def change
    change_column :animals, :gender, :boolean
  end
end
