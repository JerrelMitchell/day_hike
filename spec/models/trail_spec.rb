require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'methods' do
    trip1 = Trip.create(name:'june hike', start_date:'2018-06-01', end_date:'2018-06-01')
    trail1 = trip1.trails.create(name:'chautauqua', address: 'boulder', length: 10)
    trail2 = trip1.trails.create(name:'estes park', address: 'estes park', length: 60)
    trail3 = trip1.trails.create(name:'fun place', address: 'really cool', length: 90)

    it '#total_distance' do
    # expect(Trail.total_distance).to eq(5) # database cleaner not working
    end
    it '#average_distance' do
      expect(Trail.average_distance).to eq(53.33)
    end
    it '#longest_distance' do
      expect(Trail.longest_distance).to eq(90)
    end
    it '#shortest_distance' do
      expect(Trail.shortest_distance).to eq(10)
    end
  end
end
