require 'spec_helper'

describe SeptaStopLocator do
  describe '.find' do
    before :each do
      @route = SeptaStopLocator.find(39.9539910, -75.1682170, 34)
    end

    it 'returns the closest SEPTA stop for a route and a point' do
      expect(@route['stopname']).to eq '15th St Trolley Station'
    end

    context 'the keys it returns' do
      it 'has a distance' do
        expect(@route['distance']).to eq 935.6262555741262
      end

      it 'has a lat' do
        expect(@route['lat']).to eq 39.952672
      end

      it 'has a lng' do
        expect(@route['lng']).to eq -75.165345
      end

      it 'has a stopid' do
        expect(@route['stopid']).to eq 20659
      end
    end
  end
end
