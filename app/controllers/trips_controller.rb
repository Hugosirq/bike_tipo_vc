# frozen_string_literal: true

class TripsController < ApplicationController
  def index
    trips = Trip.search(params[:q]).result
    render_object trips
  end

  def show
    trip = Trip.find(params[:id])
    render_object trip
  end

  def create
    trip = Trip.new(trip_params)
    trip.save
    render_object trip
  end

  def update
    trip = Trip.find(params[:id])
    trip.update_attributes(trip_params)
    render_object trip
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    render_object trip
  end

  private

  def trip_params
    params.require(:trip).permit(
      :user_id, :origin_station_id, :final_station_id, :bike_id,
      :meters_distance, :start_date, :end_date, :extra_minutes, :pricing
    )
  end
end
