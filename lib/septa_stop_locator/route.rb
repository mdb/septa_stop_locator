require 'json'

module SeptaStopLocator
  class Route
    def initialize(route)
      @uri = URI.parse("http://www3.septa.org/hackathon/Stops/#{route}")
    end

    def stops
      @stops ||= JSON.parse(get_stops)
    end

    private

    def get_stops
      Net::HTTP.get(@uri)
    end
  end
end
