class ReviewsController < ApplicationController
  before_action :set_reservation

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.field = @field
    @review.save
    redirect_to field_reservations
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end
end
