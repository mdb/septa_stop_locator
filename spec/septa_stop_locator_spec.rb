require 'spec_helper'

describe SeptaStopLocator do
  describe '.find' do
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
        expect(@first['distance']).to eq 935.6262555741262
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
  end
end
