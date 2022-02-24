class ReservationsController < ApplicationController

  def index
    # @reservations = Reservation.where(user: current_user)
    @reservations = policy_scope(Reservation).where(user: current_user)
  end

  def show
    # @fields = Field.find(params[:field_id])
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def new
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @field = Field.find(params[:field_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.field = @field
    @reservation.user = current_user
    authorize @reservation
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    authorize @reservation
    redirect_to reservations_path(@reservation)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    authorize @reservation
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_time)
  end

  #def set_field
  #   @field = Field.find(params[:field_id])
  # end
end
