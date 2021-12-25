class Trainer < ApplicationRecord
  has_many :pokemons

  def date_created
    self.created_at.strftime("%m/%d/%Y  %H:%M %Z")
  end
end
