class ReviewsController < ApplicationController
  def create # standard method - do not rename :)
    restaurant = Restaurant.find(params[:restaurant_id])
    review = Review.new(review_params)
    review.save
    if review.errors.messages.length == 1
      restaurant.reviews << review
      flash[:notice] = "Thanks #{review[:author]}, review has been saved"
    else
      flash[:notice] = "You must submit a score for your review"
    end
    redirect_to restaurant_path(restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:author, :text, :score)
  end
end
