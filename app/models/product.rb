class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :details, presence: true
  validates :stock, presence: true
end
