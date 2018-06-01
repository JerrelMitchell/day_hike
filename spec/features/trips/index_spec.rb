require 'rails_helper'

describe 'Visitor' do

  # As a visitor,
  # when I visit the hiking trips index page,
  # I see a list of all hiking trip names in
  # the database.
  it 'shows a list of all trip names' do
    trip1 = Trip.create(name:'june hike', start_date:'2018-06-01', end_date:'2018-06-01')

    visit trips_path

    expect(page).to have_content(trip1.name)
  end

  it 'takes me to a trip show page when I click a trip name' do
    trip1 = Trip.create(name:'june hike', start_date:'2018-06-01', end_date:'2018-06-01')

    visit trips_path

    click_on trip1.name

    expect(current_path).to eq(trip_path(trip1))
  end

end
