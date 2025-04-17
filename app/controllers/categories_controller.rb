class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin!

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category created successfully!"
    else
      redirect_to categories_path, alert: "Failed to create category."
    end
  end

  private

  def check_admin!
    redirect_to root_path, alert: "Access denied!" unless current_user.admin?
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
