# frozen_string_literal: true

class StationsController < ApplicationController
  def index
    stations = Station.search(params[:q]).result
    render_object stations
  end

  def show
    station = Station.find(params[:id])
    render_object station
  end

  def create
    station = Station.new(station_params)
    station.save
    render_object station
  end

  def update
    station = Station.find(params[:id])
    station.update_attributes(station_params)
    render_object station
  end

  def destroy
    station = Station.find(params[:id])
    station.destroy
    render_object station
  end

  private

  def station_params
    params.require(:station).
      permit(:description, :address, :neighborhood, :max_capacity)
  end
end
