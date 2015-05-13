class ReviewsController < ApplicationController
  before_action :authenticate_user!

  expose(:review)
  expose(:product)

  def edit
    respond_to do |format|
      format.html { (flash[:error] = "You don't have permission to do this."; redirect_to :back) unless current_user.products.include?(review) || current_user.reviews.include?(review) }
      format.js {render layout: false}
    end
  end

  def create
    self.review = Review.new(review_params)

    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      redirect_to :back
      flash[:error] = "Problem with creating the review."
    end
  end

  def update
    if current_user.reviews.include?(review) || current_user.admin?
      if self.review.update(review_params)
        redirect_to category_product_path(product.category, product), notice: 'Review was successfully updated.'
      else
        redirect_to category_product_path(product.category, product)
        flash[:error] = "Problem with updating the review."
      end
    else
      redirect_to category_product_path(product.category, product)
      flash[:error] = "You are not allowed to edit this product."
    end
  end

  def destroy
    if current_user.products.include?(review) || current_user.reviews.include?(review) || current_user.admin?
      review.destroy
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
    else
      flash[:error] = "You don't have permission to do this."
      redirect_to :back
    end
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating, :category_id, :product_id, :user_id)
    end
end
