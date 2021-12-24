require 'rails_helper'

RSpec.describe Pokemon, type: :feature do
  before :each do
    @ash = Trainer.find_or_create_by!(name: "Ash", age: 10, certified: false)
    @blue = Trainer.find_or_create_by!(name: "Blue", age: 11, certified: false)
    @red = Trainer.find_or_create_by!(name: "Red", age: 11, certified: false)

    @pikachu = @ash.pokemons.find_or_create_by!(name: "Pikachu", base_hp: 35, in_battle: false)
    @pidgeot = @ash.pokemons.find_or_create_by!(name: "Pidgeot", base_hp: 83, in_battle: false)

    @squirtle = @blue.pokemons.find_or_create_by!(name: "Squirtle", base_hp: 44, in_battle: false)
    @eevee = @blue.pokemons.find_or_create_by!(name: "Eevee", base_hp: 55, in_battle: false)

    @charmander = @red.pokemons.find_or_create_by!(name: "Charmander", base_hp: 39, in_battle: false)
    @torchic = @red.pokemons.find_or_create_by!(name: "Torchic", base_hp: 45, in_battle: false)
  end

  it 'displays one pokemons attributes' do
    visit "/pokemons/#{@pikachu.id}"

    expect(page).to have_content(@pikachu.name)
    expect(page).to have_content(@pikachu.base_hp)
    expect(page).to have_content(@pikachu.in_battle)
  end
end
