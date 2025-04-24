class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @users = User.all
      @products = Product.all
    else
      @products = Product.all
    end
  end

  def wished_products
    @wishlists = current_user.wished_products.all
  end
end
