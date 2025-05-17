class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :details, presence: true
  validates :stock, presence: true

  has_rich_text :additional_info


  belongs_to :user
  belongs_to :category, optional: true
  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_by_users, through: :wishlists, source: :user

  has_one :animal_attribute, dependent: :destroy
  has_one :bird_attribute, dependent: :destroy

  accepts_nested_attributes_for :animal_attribute, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :bird_attribute, reject_if: :all_blank, allow_destroy: true

  # Helper method to check category type
  def animal?
    category&.category_type == 'animal'
  end

  def bird?
    category&.category_type == 'bird'
  end

  # Custom validation to ensure appropriate attribute is present
  validate :validate_category_specific_attributes

  private

  def validate_category_specific_attributes
    if animal? && animal_attribute.nil?
      errors.add(:base, "Animal attributes must be provided for animal products")
    elsif bird? && bird_attribute.nil?
      errors.add(:base, "Bird attributes must be provided for bird products")
    end
  end


end
