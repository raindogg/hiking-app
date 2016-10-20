class PointsController < ApplicationController
  def create
    @point = Point.create(trek_id: params[:trek_id],
                          start: params[:start],
                          end: params[:end],
                          latitude: params[:latitude],
                          longitude: params[:longitude])

    redirect_to "/treks/#{@point.trek_id}"
  end
end
