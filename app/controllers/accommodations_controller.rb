class AccommodationsController < ApplicationController

	before_action :set_accommodation, only: [:index, :show]

	def index
		@accommodations = Accommodation.all.order(created_at: :desc)
	end

	def show
		@accommodation = Accommodation.find(params[:id])
	end

	private

	def set_accommodation
		@states = Place.distinct.pluck(:state)
	end

end
