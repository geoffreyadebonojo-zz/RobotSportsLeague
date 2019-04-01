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

  def roster
    self.players.where("on_team = true")
  end

  def unassigned
    self.players.where("status = 3")
  end

  def starters
    self.players.where("status = 2")
  end

  def alternates
    self.players.where("status = 1")
  end

  def free_agents
    self.players.where("status = 0")
  end
end
