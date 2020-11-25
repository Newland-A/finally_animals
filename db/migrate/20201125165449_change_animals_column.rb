class ChangeAnimalsColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :animals, :gender, :string
  end
end
