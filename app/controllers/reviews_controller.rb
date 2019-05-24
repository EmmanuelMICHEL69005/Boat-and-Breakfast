class ReviewsController < ApplicationController
  def create
    @boat = Boat.find(params[:boat_id])
    @review = Review.new(review_params)
    @review.boat = @boat
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to boat_path(@boat) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'boat/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
