class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new # get request, for the /new view
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "#{@restaurant.name} saved"
      redirect_to @restaurant
    else
      render :new
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find params[:id]
    @reviews = @restaurant.reviews
  end

  private
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
