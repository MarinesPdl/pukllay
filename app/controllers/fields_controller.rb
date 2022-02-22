class FieldsController < ApplicationController
  def index
    @fields = Field.all
  end

  def show
    @field = Field.find(params[:id])
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(field_params)
    @field.user = current_user
    if @field.save
      redirect_to field_path(@field)
    else
      render :new
    end
  end

  def edit
    @field = Field.find(params[:id])
  end
  
  def update
    @field = Field.find(params[:id])
    @field.update(field_params)
    redirect_to fields_path
  end

  private

  def field_params
    params.require(:field).permit(:name, :address, :phone_number, :availability)
  end
end
