class ReservationsController < ApplicationController

  def index
    # @reservations = Reservation.where(user: current_user)
    @reservations = current_user.reservations
  end

  def show
    # @fields = Field.find(params[:field_id])
    @reservations = Reservation.find(params[:id])
  end

  def new
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new
  end

  def create
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.field = @field
    @reservation.user = current_user

    if @reservation.save
      redirect_to field_reservations_path(@reservation)
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :time)
  end
end
