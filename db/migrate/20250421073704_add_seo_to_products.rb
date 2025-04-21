class AddSeoToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :seo_title, :string
    add_column :products, :meta_description, :text
    add_column :products, :seo_keywords, :string
  end
end
