require 'spec_helper'

describe SeptaStopLocator::Route do
  describe '#stops', vcr: { cassette_name: 'route' } do
    let(:route) { SeptaStopLocator::Route.new(34) }

    it 'returns an array of the stops for a route' do
      expect(route.stops.class).to eq Array
    end

    context 'a stop hash in the stops array' do
      let(:stop) { route.stops[0] }

      it 'has a lng' do
        expect(stop['lng']).to eq -75.162559
      end

      it 'has a lat' do
        expect(stop['lat']).to eq 39.952532
      end

      it 'has a stopid' do
        expect(stop['stopid']).to eq 283
      end

      it 'has a stopname' do
        expect(stop['stopname']).to eq '13th St Trolley Station'
      end
    end
  end
end
