require 'rails_helper'

RSpec.describe 'Trainers index' do
  it 'visits the trainer index page' do
    visit '/trainers'
    expect(current_path).to eq('/trainers')
  end
end
