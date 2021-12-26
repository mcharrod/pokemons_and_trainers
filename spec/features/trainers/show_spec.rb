require 'rails_helper'

RSpec.describe Trainer, type: :feature do
  it 'shows trainer info on show page' do
    @ash = Trainer.find_or_create_by!(name: "Ash", age: 10, certified: false)
    @blue = Trainer.find_or_create_by!(name: "Blue", age: 11, certified: false)
    @red = Trainer.find_or_create_by!(name: "Red", age: 11, certified: false)

    visit "/trainers/#{@ash.id}"
    expect(page).to have_content(@ash.name)
    expect(page).to have_content(@ash.age)
    expect(page).to have_content(@ash.certified)
  end

  it 'shows how many pokemon the trainer cares for' do
    @ash = Trainer.find_or_create_by!(name: "Ash", age: 10, certified: false)
    @blue = Trainer.find_or_create_by!(name: "Blue", age: 11, certified: false)
    @red = Trainer.find_or_create_by!(name: "Red", age: 11, certified: false)

    visit "/trainers/#{@red.id}"
    expect(page).to have_content("Number of Pokemon: 2")
  end

  it 'has a link to the trainers pokemons index' do
    @blue = Trainer.find_or_create_by!(name: "Blue", age: 11, certified: false)
    @red = Trainer.find_or_create_by!(name: "Red", age: 11, certified: false)

    @charmander = @red.pokemons.find_or_create_by!(name: "Charmander", base_hp: 39, in_battle: false)
    @torchic = @red.pokemons.find_or_create_by!(name: "Torchic", base_hp: 45, in_battle: false)

    visit "/trainers/#{@blue.id}"
    expect(page).to have_link("View #{@blue.name}'s Pokemon")
  end
end
