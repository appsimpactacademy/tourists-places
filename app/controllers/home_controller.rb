class HomeController < ApplicationController
  def index
    @places = Place.order(created_at: :desc)
  end
end
