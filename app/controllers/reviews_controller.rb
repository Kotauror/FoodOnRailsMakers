class ReviewsController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    review = restaurant.reviews.new(params[:review])
    review.save
    flash[:notice] = "Thanks #{review[:author]} review has been saved"
    redirect_to restaurant_path(restaurant)
  end
end
