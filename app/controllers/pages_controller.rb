class PagesController < ApplicationController
  def index
    @products = Product.all
  end
  def about
  end
  def contact
  end
end
