class Team < ApplicationRecord
  has_secure_password
  after_create :generate_players

  validates :name, uniqueness: true
  validates :email, uniqueness: true

  has_many :players

  def generate_players
    100.times do
      self.players.create(
        name: Faker::Name.unique.name,
        player_id: (Faker::Alphanumeric.alpha(4).upcase + rand(99).to_s),
        speed: rand(50),
        strength: rand(50),
        agility: rand(50)
      )
    end
  end
end
