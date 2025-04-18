class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :details, presence: true
  validates :stock, presence: true

  has_rich_text :additional_info


  belongs_to :user
  belongs_to :category, optional: true

end
