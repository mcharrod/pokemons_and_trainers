require 'rails_helper'

RSpec.describe 'the Trainer creation' do
  it 'links to the new trainer page from the trainer index' do
    visit '/trainers'

    click_on "New Trainer"
    expect(current_path).to eq("/trainers/new")
  end

  it 'can create a new trainer' do
    visit '/trainers/new'
    fill_in('Name', with: 'Misty')
    fill_in('Age', with: 10)
    fill_in('Certified', with: false)
    click_button('Create Trainer')

    expect(current_path).to eq('/trainers')
    save_and_open_page
    expect(page).to have_content('Misty')
  end
end
