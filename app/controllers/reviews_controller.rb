class ReviewsController < ApplicationController
  before_action :authenticate_user!

  expose(:review)
  expose(:product)

  def edit
    (flash[:error] = "You don't have permission to do this."; redirect_to :back) unless current_user.products.includes(review) || current_user.includes(review)
  end

  def create
    self.review = Review.new(review_params)

    if review.save
      product.reviews << review
      current_user << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    if current_user.product.includes(review) || current_user.includes(review)
      review.destroy
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
    else
      flash[:error] = "You don't have permission to do this."
      redirect_to :back
    end
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
