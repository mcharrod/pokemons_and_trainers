require 'rails_helper'

RSpec.describe Trainer, type: :feature do
  it 'shows trainer info on show page' do
    @ash = Trainer.find_or_create_by!(name: "Ash", age: 10, certified: false)
    @blue = Trainer.find_or_create_by!(name: "Blue", age: 11, certified: false)
    @red = Trainer.find_or_create_by!(name: "Red", age: 11, certified: false)

    visit "/trainers/#{@ash.id}"
    save_and_open_page
    expect(page).to have_content(@ash.name)
    expect(page).to have_content(@ash.age)
    expect(page).to have_content(@ash.certified)
  end
end
