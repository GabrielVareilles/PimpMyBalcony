class ReviewsController < ApplicationController
  skip_after_action :verify_authorized
  def create
    @balcony = Balcony.find(params[:balcony_id])
    @review = Review.new(review_params)
    @review.balcony = @balcony
    if @review.save
      respond_to do |format|
        format.html { redirect_to public_balcony_path(@balcony) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to public_balcony_path(@balcony) }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
