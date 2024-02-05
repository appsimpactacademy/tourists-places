class PlacesController < ApplicationController
  def index
    @places = Place.all.order(created_at: :desc)
  end

  def show
    @place = Place.find(params[:id])
    @tourist_points = @place.tourist_points
  end

  def places_in_state
    @state = params[:state]
    @places_in_state = Place.where(state: @state).order(created_at: :desc)
  end
end