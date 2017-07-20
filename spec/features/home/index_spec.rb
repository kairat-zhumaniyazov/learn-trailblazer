require 'rails_helper'

feature 'Index of things' do
  given!(:first_thing) { Thing::Create.(thing: { name: 'First Thing' })['model'] }
  given!(:second_thing) { Thing::Create.(thing: { name: 'Second Thing' })['model'] }

  scenario 'root path' do
    visit '/'

    expect(page).to have_selector('.columns .header a', text: first_thing.name)
    expect(page).to_not have_selector('.columns.end .header a', text: first_thing.name)
    expect(page).to have_selector('.columns.end .header a', text: second_thing.name)
  end
end
