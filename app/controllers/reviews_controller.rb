class ReviewsController < ApplicationController
  def create # standard method - do not rename :) 
    restaurant = Restaurant.find(params[:restaurant_id])
    review = Review.new(review_params)
    restaurant.reviews << review
    restaurant.save
    flash[:notice] = "Thanks #{review[:author]} review has been saved"
    redirect_to restaurant_path(restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:author, :text, :score)
  end
end
