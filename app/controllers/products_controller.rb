class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: %i[show edit update destroy edit_seo update_seo]
  before_action :require_admin!, only: %i[new create edit update destroy edit_seo update_seo]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
    # show the related products for the same category
    @related_products = Product.where(category_id: @product.category_id)
                               .where.not(id: @product.id).limit(4)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    @product.user = current_user if current_user.admin?

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /products/1/edit_seo
  def edit_seo
  end

  # PATCH /products/1/update_seo
  def update_seo
    if @product.update(product_seo_params)
      redirect_to dashboard_path, notice: "SEO updated successfully"
    else
      render :edit_seo, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
    unless @product
      redirect_to products_path, alert: "Product not found"
      return
    end
  end

  def product_params
    params.require(:product).permit(:title, :details, :product_status, :price, :stock, :additional_info, :category_id)
  end

  def product_seo_params
    params.require(:product).permit(:seo_title, :meta_description, :seo_keywords)
  end

  def require_admin!
    unless current_user&.admin?
      redirect_to products_path, alert: "You are not authorized to perform this action."
      return
    end
  end
end
