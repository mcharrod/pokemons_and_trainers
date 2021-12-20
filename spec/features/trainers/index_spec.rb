require 'rails_helper'

RSpec.describe 'Trainers index' do
  it 'can navigate to the trainer index through welcome page' do
    visit '/'
    click_on "View Trainers"
    expect(current_path).to eq('/trainers')
  end

  it 'displays all trainers on page' do
    @ash = Trainer.find_or_create_by!(name: "Ash", age: 10, certified: false)
    @blue = Trainer.find_or_create_by!(name: "Blue", age: 11, certified: false)
    @red = Trainer.find_or_create_by!(name: "Red", age: 11, certified: false)

    visit '/trainers'

    expect(page).to have_content(@ash.name)
    expect(page).to have_content(@blue.name)
    expect(page).to have_content(@red.name)
  end
end
