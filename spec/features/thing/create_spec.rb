require 'rails_helper'

feature 'Thing Create' do
  scenario 'with invalid params' do
    visit '/things/new'
    click_on 'Create Thing'

    expect(page).to have_selector '.errors'
  end

  scenario 'with valid params' do
    visit '/things/new'
    fill_in 'Name', with: 'Rails'
    fill_in 'Description', with: 'Kickass web dev'
    click_on 'Create Thing'

    expect(current_path).to eq thing_path(Thing.last)
  end
end
