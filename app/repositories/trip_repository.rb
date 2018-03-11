# frozen_string_literal: true

class TripRepository
  def self.create(trip)
    data = SpringFieldService.create_trip(springfiled_trip(trip))
    data.status == 200 ? TripRepository.entity_for(trip) : data
  end

  private

  def springfield_trip(trip)
    {
      user_id: trip.user_id, bike_id: trip.bike_id,
      started_at: I18n.l(trip.start_date, format: :timestamp),
      finished_at: I18n.l(trip.end_date, format: :timestamp),
      traveled_distance: trip.meters_distance,
      origin: { station_id: trip.origin_station_id },
      destination: { station_id: trip.final_station_id }
    }
  end

  def entity_for(trip)
    TripEntity.new(
      user_id: trip.user_id,
      bike_id: trip.bike_id,
      started_at: trip.start_date,
      finished_at: trip.end_date,
      traveled_distance: trip.meters_distance,
      origin_station_id: trip.origin_station_id,
      destination_station_id: trip.final_station_id
    )
  end
end
