class PlacesController < ApplicationController

  before_action :set_state, only: [:index, :show, :edit, :destroy, :places_in_state, :new, :create ]

  def index
    @places = Place.all.order(created_at: :desc)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.create(place_params)
    if @place.save
      redirect_to @place, notice: "Place successfully created!"
    else
      render :new, alert: "Something went wrong!"
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def show
    @place = Place.find(params[:id])
    @accommodations = Accommodation.where(city: @place.city)
  end

  def update
    @place = Place.find(params[:id])

    if @place.update(place_params)
      redirect_to @place, notice: "Place successfully updated!"
    else
      render :edit, alert: "Something went wrong!"
    end
  end

  def destroy
    @place = Place.find(params[:id])

    if @place.destroy
      redirect_to @place
    end
  end

  def places_in_state
    @state = params[:state]
    @places_in_state = Place.where(state: @state).order(created_at: :desc)
  end

  private

  def set_state
    @states = Place.distinct.pluck(:state)
  end

  def place_params
    params.require(:place).permit(:name, :city, :state, :description, :latitude, :longitude, :image_url, images: [])
  end
end