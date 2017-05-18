class ReviewsController < ApplicationController

  def new
    @yacht = Yacht.find(params[:yacht_id])
    @review = Review.new
  end

  def create
    @yacht = Yacht.find(params[:yacht_id])
    review = @yacht.reviews.create(review_params)
    if review.save
      review.user_id = current_user.id
      review.save
      redirect_to yacht_path(@yacht)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
