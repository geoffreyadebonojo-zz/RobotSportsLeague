class Team < ApplicationRecord
  has_secure_password
  after_create :generate_players

  validates :name, uniqueness: true
  validates :email, uniqueness: true

  has_many :players

  def generate_players
    10.times do
      self.players.create(
        name: Faker::Name.unique.name,
        player_id: (Faker::Alphanumeric.alpha(4).upcase + rand(99).to_s),
        speed: 1,
        strength: 1,
        agility: 1
      )
    end
    binding.pry
  end
end
