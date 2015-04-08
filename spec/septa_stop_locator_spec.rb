require 'spec_helper'

describe SeptaStopLocator do
  describe '.find', vcr: { cassette_name: 'stop_locator' } do
    before :each do
      @stops = SeptaStopLocator.find(39.9539910, -75.1682170, 34)
    end

    it 'returns an array of the two closest stop ids' do
      expect(@stops.length).to eq 2
    end

    context 'the keys each route contains' do
      before do
        @first = @stops[0]
      end

      it 'returns the closest SEPTA stop for a route and a point' do
        expect(@first['stopname']).to eq '15th St Trolley Station'
      end

      it 'has a distance' do
        # Travis.ci thinks 935.6262555741263; laptop thinks 935.6262555741262
        approx_distance = @first['distance'].round(12)

        expect(approx_distance).to eq 935.626255574126
      end

      it 'has a lat' do
        expect(@first['lat']).to eq 39.952672
      end

      it 'has a lng' do
        expect(@first['lng']).to eq -75.165345
      end

      it 'has a stopid' do
        expect(@first['stopid']).to eq 20659
      end
    end

    context 'when the lat/lng coordinates are just east of 13th Street Station', vcr: { cassette_name: 'stop_locator_east' } do
      before :each do
        @stops = SeptaStopLocator.find(39.9533884, -75.1591538, 34)
      end

      it 'only returns the westbound stop' do
        expect(@stops.length).to eq 1
      end

      it 'returns the correct stop name' do
        expect(@stops[0]['stopname']).to eq '13th St Trolley Station'
      end
    end
  end
end
