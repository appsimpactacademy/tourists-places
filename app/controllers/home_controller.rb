class HomeController < ApplicationController
  def index
    @q = Place.ransack(params[:q])
    @places = @q.result(distinct: true).order(created_at: :desc)
  end
end
