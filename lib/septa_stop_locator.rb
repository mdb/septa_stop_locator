require 'septa_stop_locator/version'
require 'septa_stop_locator/route'
require 'haversine'

module SeptaStopLocator
  def self.find(lat, long, route)
    stops = SeptaStopLocator::Route.new(route).stops

    stop_one = stops.each { |stop|
      stop['distance'] = Haversine.distance(lat, long, stop['lat'], stop['lng']).to_feet
    }.min_by { |stop| stop['distance'] }

    stop_two = stops.find { |stop|
      (stop['stopname'] == stop_one['stopname']) && (stop['stopid'] != stop_one['stopid'])
    }

    [stop_one, stop_two].compact
  end
end
