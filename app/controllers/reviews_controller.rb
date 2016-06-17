class ReviewsController < ApplicationController
  skip_after_action :verify_authorized
  def create
    @balcony = Balcony.find(params[:balcony_id])
    @review = Review.new(review_params)
    @review.balcony = @balcony
    if @review.save
      redirect_to public_balcony_path(@balcony)
    else
      redirect_to public_balcony_path(@balcony)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
