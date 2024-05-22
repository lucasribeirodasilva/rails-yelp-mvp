class ReviewsController < ApplicationController

  before_action :set_restaurant, only: [:create]

  def create
    @review = Review.new(review_params)

    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), status: :see_other
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
