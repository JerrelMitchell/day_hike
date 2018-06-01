require 'rails_helper'

describe 'Trip Show Page' do

  # I see a list of trails included in the trip,
  # I see the name, address, and length for each trail.
  it 'should show trail names, address, and length' do
    trip1 = Trip.create(name:'june hike', start_date:'2018-06-01', end_date:'2018-06-01')
    trail1 = trip1.trails.create(name:'chautauqua', address: 'boulder', length: 10)
    trail2 = trip1.trails.create(name:'estes park', address: 'ested park', length: 60)

    visit trip_path(trip1)

    expect(page).to have_link(trail1.name)
    expect(page).to have_content(trail1.address)
    expect(page).to have_content(trail1.length)
    expect(page).to have_content(trail2.name)
    expect(page).to have_content(trail2.address)
    expect(page).to have_content(trail2.length)
  end

  it 'should show the total, average, longest, and shortest hiking distance for all trails on trip' do
    trip1 = Trip.create(name:'june hike', start_date:'2018-06-01', end_date:'2018-06-01')
    trail1 = trip1.trails.create(name:'chautauqua', address: 'boulder', length: 10)
    trail2 = trip1.trails.create(name:'estes park', address: 'estes park', length: 60)
    trail3 = trip1.trails.create(name:'fun place', address: 'really cool', length: 90)

    visit trip_path(trip1)

    expect(page).to have_content("Total Hiking Distance For This Trip: #{Trail.total_distance}")
    expect(page).to have_content("Average Hiking Distance For This Trip: #{Trail.average_distance}")
    expect(page).to have_content("Shortest Hiking Distance For This Trip: #{Trail.longest_distance}")
    expect(page).to have_content("Longest Hiking Distance For This Trip: #{Trail.shortest_distance}")
  end

end
