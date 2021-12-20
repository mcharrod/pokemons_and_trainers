require 'rails_helper'

describe Trainer, type: :model do
  describe "relationships" do
    it { should have_many(:pokemons) }
  end
end
