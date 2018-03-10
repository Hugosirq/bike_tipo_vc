# frozen_string_literal: true

class BikesController < ApplicationController
  def index
    bikes = Bike.search(params[:q]).result
    render_object bikes
  end

  def show
    bike = Bike.find(params[:id])
    render_object bike
  end

  def create
    bike = Bike.new(bike_params)
    bike.save
    render_object bike
  end

  def update
    bike = Bike.find(params[:id])
    bike.update_attributes(bike_params)
    render_object bike
  end

  def destroy
    bike = Bike.find(params[:id])
    bike.destroy
    render_object bike
  end

  private

  def bike_params
    params.require(:bike).
      permit(:code, :condition_cd, :locable_id, :locable_type)
  end
end
