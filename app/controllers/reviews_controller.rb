class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    product = Product.find(params[:product_id])
    review = product.reviews.create(review_params)
    review.user = current_user

    if review.save
      redirect_to product_path(product)
    else
      redirect_to product_path(product)
    end
  end

  def destroy
    puts "PARAMS: " + params[:id]
    Review.find_by(id: params[:id]).destroy
    redirect_to "/products/#{params[:product_id]}"
  end

  private
    def review_params
      params.require(:review).permit(
        :description,
        :rating
      )
    end

end
