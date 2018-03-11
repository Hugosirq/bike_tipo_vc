# frozen_string_literal: true

class TripRepository
  def create(trip)
    data = SpringfieldService.create_trip(springfield_trip(trip))
    data.code == 201 ? entity_for(trip) : data
  end

  private

  def springfield_trip(trip)
    {
      user_id: trip.user_id.to_i, bike_id: trip.bike_id.to_i,
      started_at: I18n.l(trip.start_date, format: :timestamp),
      finished_at: I18n.l(trip.end_date, format: :timestamp),
      traveled_distance: trip.meters_distance.to_f,
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
