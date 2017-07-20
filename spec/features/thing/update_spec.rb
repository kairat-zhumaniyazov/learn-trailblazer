require 'rails_helper'

feature 'Thing Update' do
  given!(:thing) { Thing::Create.(thing:
      { name: 'Rails', description: 'Kickass web dev' }
    )['model']
  }

  scenario 'with invalid params' do
    visit "/things/#{thing.id}/edit"

    expect(page).to have_selector "form #thing_name.readonly[value='#{thing.name}']"

    fill_in 'Description', with: 'Q'
    click_on 'Update Thing'

    expect(page).to have_content 'description is too short (minimum is 4 characters)'
    expect(current_path).to eq thing_path(Thing.last)
  end

  scenario 'with valid params' do
    visit "/things/#{thing.id}/edit"

    expect(page).to have_selector "form #thing_name.readonly[value='#{thing.name}']"

    fill_in 'Description', with: 'Updated'
    click_on 'Update Thing'

    expect(current_path).to eq thing_path(Thing.last)
  end
end
