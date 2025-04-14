class RemoveProductTypeAndStatusFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :product_type, :string
    add_column :products, :product_status, :string
  end
end
