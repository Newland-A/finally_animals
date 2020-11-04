class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :weight
      t.string :species
      t.string :breed
      t.string :color
      t.text :medical_info
      t.boolean :altered

      t.timestamps null: false
    end
  end
end
