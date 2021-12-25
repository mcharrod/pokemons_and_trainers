class Trainer < ApplicationRecord
  has_many :pokemons

  def date_created
    self.created_at.strftime("%m/%d/%Y  %H:%M %Z")
  end

  def pokecount
    self.pokemons.count
  end
end
