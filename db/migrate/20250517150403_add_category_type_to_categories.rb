class AddCategoryTypeToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :category_type, :string
  end
end
