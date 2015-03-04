require 'septa_stop_locator/version'
require 'septa_stop_locator/route'
require 'haversine'

module SeptaStopLocator
  def self.find(lat, long, route)
    stops = SeptaStopLocator::Route.new(route).stops

    stops.each { |stop|
      stop['distance'] = Haversine.distance(lat, long, stop['lat'], stop['lng']).to_feet
    }.min_by { |stop| stop['distance'] }
  end
end
