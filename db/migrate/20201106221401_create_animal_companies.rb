class CreateAnimalCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :animal_companies do |t|
      t.belongs_to :animal
      t.belongs_to :company
      
      t.timestamps
    end
  end
end
