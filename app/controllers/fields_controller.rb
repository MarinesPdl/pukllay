class FieldsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @fields = policy_scope(Field)
  end

  def show
    @field = Field.find(params[:id])
    @reservations = @field.reservations
    authorize @field
  end

  def new
    @field = Field.new
    authorize @field
  end

  def create
    @field = Field.new(field_params)
    authorize @field
    @field.user = current_user
    if @field.save
      redirect_to field_path(@field)
    else
      render :new
    end
  end

  def edit
    @field = Field.find(params[:id])
    authorize @field
  end

  def update
    @field = Field.find(params[:id])
    authorize @field
    @field.update(field_params)
    redirect_to fields_path
  end

  private

  def field_params
    params.require(:field).permit(:name, :address, :phone_number, :availability)
  end
end
