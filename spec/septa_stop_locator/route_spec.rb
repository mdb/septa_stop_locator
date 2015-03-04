require 'spec_helper'

describe SeptaStopLocator::Route do
  describe '#stops' do
    it 'returns an array of the stops for a route' do
      route = SeptaStopLocator::Route.new(34)

      expect(route.stops).to eq 'foo'
    end
  end
end
