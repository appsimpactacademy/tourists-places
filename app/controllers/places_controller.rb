class PlacesController < ApplicationController

  before_action :set_state, only: [:index, :show, :places_in_state ]

  def index
    @places = Place.all.order(created_at: :desc)
  end

  def show
    @place = Place.find(params[:id])
  end

  def places_in_state
    @state = params[:state]
    @places_in_state = Place.where(state: @state).order(created_at: :desc)
  end

  private

  def set_state
    @states = Place.distinct.pluck(:state)
  end
end