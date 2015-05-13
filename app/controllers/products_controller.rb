class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
    respond_to do |format|
      format.html { (redirect_to category_product_url(product.category, product); flash[:error] = "You are not allowed to edit this product.") unless product.user == current_user }
      format.js {render layout: false}
    end
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      category.products << product
      current_user.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if product.user == current_user || current_user.admin?
      if self.product.update(product_params)
        redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
      else
        render action: 'edit'
      end
    else
      redirect_to category_product_url(product.category, product)
      flash[:error] = "You are not allowed to edit this product."
    end
  end

  # DELETE /products/1
  def destroy
    if product.user == current_user || current_user.admin?
      product.destroy
      redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
    else
      flash[:error] = "You are not allowed to edit this product."
      redirect_to category_url(category)
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
