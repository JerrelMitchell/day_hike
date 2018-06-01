

describe 'Trail Show Page' do
  # As a visitor,
  # when I visit a trail's page,
  # I see the name, address, and total length of
  # every hiking trip that includes this trail

  it 'should show trail names, address, and length' do
    trip1 = Trip.create(name:'june hike', start_date:'2018-06-01', end_date:'2018-06-01')
    trip2 = Trip.create(name:'june hike', start_date:'2018-06-01', end_date:'2018-06-01')
    trail1 = trip1.trails.create(name:'chautauqua', address: 'boulder', length: 10)
    trail2 = trip2.trails.create(name:'chautauqua', address: 'boulder', length: 60)

    visit trail_path(trail1)

    expect(page).to have_content(trip1.name)
    expect(page).to have_content(trip2.name)
  end
end
