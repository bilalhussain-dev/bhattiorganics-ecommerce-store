class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :details
      t.string :product_type
      t.decimal :price
      t.integer :stock, default: 0


      t.timestamps
    end
  end
end
