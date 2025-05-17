class CreateAnimalAttributes < ActiveRecord::Migration[7.1]
  def change
    create_table :animal_attributes do |t|
      t.references :product, null: false, foreign_key: true
      t.string :breed
      t.integer :age
      t.decimal :weight
      t.decimal :height
      t.string :health_status
      t.string :color
      t.boolean :vaccinated

      t.timestamps
    end
  end
end
