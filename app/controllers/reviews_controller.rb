class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    product = Product.find(params[:product_id])
    review = product.reviews.create(review_params)
    review.user = current_user

    puts review.inspect
    if review.save
      redirect_to product_path(product)
    else
      redirect_to product_path(product)
    end
  end

  private
    def review_params
      params.require(:review).permit(
        :description,
        :rating
      )
    end

end
