class CreateBirdAttributes < ActiveRecord::Migration[7.1]
  def change
    create_table :bird_attributes do |t|
      t.references :product, null: false, foreign_key: true
      t.string :cage_type
      t.string :color
      t.integer :age
      t.decimal :weight
      t.string :health_status
      t.boolean :vaccinated

      t.timestamps
    end
  end
end
