require "rails_helper"

describe Pokemon, type: :model do
  describe "relationships" do
    it { should belong_to(:trainer) }
  end
end
