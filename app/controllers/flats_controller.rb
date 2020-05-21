class FlatsController < ApplicationController
   before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].nil?
      @flats = Flat.all
    else
      sql_query = "name LIKE :query OR address LIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save

    redirect_to flat_path(@flat)
  end

  def edit
  end

  def update
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy

    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :image_url)
  end
end
