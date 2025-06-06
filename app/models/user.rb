class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :products, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :wished_products, through: :wishlists, source: :product
end
