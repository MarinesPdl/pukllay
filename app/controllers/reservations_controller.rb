class ReservationsController < ApplicationController

  def index
    # @reservations = Reservation.where(user: current_user)
    @reservations = current_user.reservations
  end

  def show
    # @fields = Field.find(params[:field_id])
    @reservation = Reservation.find(params[:id])
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
      redirect_to reservations_path
    else
      render :new
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    # redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    # redirect_to reservations_path(@reservation)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_time)
  end

  # def set_field
  #   @field = Field.find(params[:field_id])
  # end
end
