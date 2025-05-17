class AnimalAttribute < ApplicationRecord
  belongs_to :product

  # Required numeric values
  validates :height, numericality: { greater_than: 0 }, presence: true
  validates :weight, numericality: { greater_than: 0 }, presence: true

  # Required fields
  validates :age, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :breed, presence: true, length: { maximum: 50 }
  validates :color, presence: true, length: { maximum: 30 }
  validates :health_status, presence: true, length: { maximum: 100 }
  validates :vaccinated, inclusion: { in: [true, false] }
end
