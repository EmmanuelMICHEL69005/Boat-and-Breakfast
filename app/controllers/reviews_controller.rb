class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.boat = @boat
    @boat.save!
    redirect_to boat_path(@boat)
  end
private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Boat.find(params[:boat_id])
  end

end
