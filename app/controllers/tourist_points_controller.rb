class TouristPointsController < ApplicationController

	def index
		@tourist_points = TouristPoint.all
	end

	def show
		@tourist_point = TouristPoint.find(params[:id])
	end

	private

	def tourist_point_params
		params.permit(:tourist_point).require(:name, :city, :state, :description, :image_url, :latitude, :longitude, :distance_from, :place)
	end
end
