class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username, presence: true, uniqueness: true
      t.string :password_digest
      t.boolean :is_owner
      t.boolean :is_vet
      t.integer :owner_id
      t.integer :animal_id
      t.integer :vet_id

      t.timestamps null: false
    end
  end
end
