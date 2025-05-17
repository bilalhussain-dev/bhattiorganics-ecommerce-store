class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :category_type, presence: true

  # Category types
  TYPES = ['animal', 'bird']

  scope :animals, -> { where(category_type: 'animal') }
  scope :birds, -> { where(category_type: 'bird') }
end
