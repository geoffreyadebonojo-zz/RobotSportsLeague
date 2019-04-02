class Player < ApplicationRecord
  belongs_to :team

  before_create :cap_stats

  validates :player_id, uniqueness: true
  validates :name, uniqueness: true

  enum status: %w(free alternate starter unassigned)

  def stats_total
    self.strength + self.speed + self.agility
  end

  def cap_stats
    if stats_total > 100
      stats_overage = stats_total - 100

      if self.strength > stats_overage
        self.strength -= stats_overage
      end

      if self.speed > stats_overage
        self.speed -= stats_overage
      end

      if self.agility > stats_overage
        self.agility -= stats_overage
      end
    end
  end

  def self.sort_by_name
    Player.order(name: :asc)
  end

  def self.sort_by_player_id
    Player.order(player_id: :asc)
  end

  def self.sort_by_strength
    Player.order(strength: :desc)
  end

  def self.sort_by_speed
    Player.order(speed: :desc)
  end

  def self.sort_by_agility
    Player.order(agility: :desc)
  end

  def self.sort_by_stats_total
    Player.all.sort {|a,b| b.stats_total <=> a.stats_total}
  end
end
