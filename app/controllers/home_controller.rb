class HomeController < ApplicationController
  def index
    @q = Place.ransack(params[:q])
    @places = @q.result(distinct: true).order(created_at: :desc).limit(6)
    # @place_counts = Place.pluck(:state).uniq.map { |state| [state, Place.where(state: state).count] }
    @states = Place.distinct.pluck(:state)
  end
end
