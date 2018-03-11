# frozen_string_literal: true

class TripEntity
  ATTRS = %i[user_id bike_id started_at finished_at traveled_distance
             origin_station_id destination_station_id].freeze

  ATTRS.each { |item| attr_reader item }

  def initialize(attrs = {})
    ATTRS.each { |key| instance_variable_set("@#{key}", attrs[key]) }
  end
end
