require "rails_helper"

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

  it 'displays all trainers in order of most recently created' do
    @ash = Trainer.find_or_create_by!(name: "Ash", age: 10, certified: false)
    @blue = Trainer.find_or_create_by!(name: "Blue", age: 11, certified: false)
    @red = Trainer.find_or_create_by!(name: "Red", age: 11, certified: false)
    @serena = Trainer.find_or_create_by!(name: "Serena", age: 13, certified: false)
    @cynthia = Trainer.find_or_create_by!(name: "Cynthia", age: 33, certified: true)

    visit '/trainers'
    expect(@ash.name).to appear_before(@blue.name)
    expect(@ash.name).to appear_before(@red.name)
    expect(@blue.name).to appear_before(@red.name)
    expect(@red.name).to appear_before(@serena.name)
  end
end
