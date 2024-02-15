class AccommodationsController < ApplicationController
  before_action :set_state_in_accommodation, only: [:index, :new, :update, :show, :edit, :destroy]
  before_action :set_accommodation, only: [:edit, :update, :show, :destroy]

  def index
    @accommodations = Accommodation.all.order(created_at: :desc)

    if params[:price_range].present?
      price_range = Array(params[:price_range]).map do |range|
        range.split("_").map(&:to_f)
      end
      @accommodations = @accommodations.where(price: price_range.flatten.min..price_range.flatten.max)
    end
  end

  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.create(accommodation_params)
    if @accommodation.save
      redirect_to @accommodation, notice: "accommodation successfully created!"
    else
      render :new, alert: "Something went wrong!"
    end
  end

  def edit
  end

  def update
    if @accommodation.update(accommodation_params)
      redirect_to @accommodation, notice: "Accommodation was updated successfully!"
    else
      render :edit, alert: "Something went wrong!"
    end
  end

  def show
  end

  def destroy
    if @accommodation.destroy
      redirect_to @accommodation, notice: "Accommodation was destroy successfully!"
    end
  end

  private

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  def set_state_in_accommodation
    @states = Place.distinct.pluck(:state)
  end

  def accommodation_params
    params.require(:accommodation).permit(:name, :description, :contact_number, :latitude, :longitude, :city, :state, :place_id, images: [] ) 
  end

end
