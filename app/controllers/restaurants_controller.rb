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
      messages = ""
      @restaurant.errors.full_messages.each do |message|
        messages += message 
      end
      flash[:notice] = messages
      render :new
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find params[:id]
    @reviews = @restaurant.reviews
    @score_counter = 0
    length = @reviews.length
    if length == 0 || length == nil then
      @average
    else
      @reviews.each do |rev|
        @score_counter += rev.score.to_i
      end
      @average = @score_counter / length
    end
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
    p "2"
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
