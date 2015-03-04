require 'json'

module SeptaStopLocator
  class Route
    def initialize(route)
      @uri ||= URI.parse("http://www3.septa.org/hackathon/Stops/#{route}")
    end

    def stops
      @stops ||= JSON.parse(get_stops)
    end

    private

    def request
      Net::HTTP::Get.new(@uri.request_uri)
    end

    def get_stops
      http = Net::HTTP.new(@uri.host, @uri.port)

      http.request(request).body
    end
  end
end
