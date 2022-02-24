class ReviewsController < ApplicationController
  before_action :set_reservation

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @reservation = Reservation.find(params[:reservation_id])
    @review.user = current_user
    authorize @review
    @review.reservation = @reservation
    if @review.save
      redirect_to reservations_path(@reservation)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end
end
