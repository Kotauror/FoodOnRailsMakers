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

  def destroy
    @restaurant = Restaurant.find params[:id]
    @restaurant.destroy
    flash[:notice] = "The restaurant was deleted."
    redirect_to '/'
  end

  def edit
    @restaurant = Restaurant.find params[:id]
  end

  def update
    @restaurant = Restaurant.find params[:id]
    if @restaurant.update_attributes(restaurant_params)
      flash[:notice] = "The restaurant was updated."
      redirect_to @restaurant
    else
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
