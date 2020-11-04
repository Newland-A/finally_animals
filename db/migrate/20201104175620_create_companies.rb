class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :location
      t.integer :user_id
      t.integer :animal_id
      t.datetime :appointment_time

      t.timestamps null: false
    end
  end
end
