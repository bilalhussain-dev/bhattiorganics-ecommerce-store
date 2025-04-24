class WishlistsController < ApplicationController
  before_action :authenticate_user!


  def create
    product = Product.find(params[:product_id])
    current_user.wished_products << product unless current_user.wished_products.include?(product)
    redirect_to product, notice: "Added to your wishlist!"
  end

  def destroy
    product = Product.find(params[:product_id])
    current_user.wished_products.destroy(product)
    redirect_to product, notice: "Removed from your wishlist."
  end
end
