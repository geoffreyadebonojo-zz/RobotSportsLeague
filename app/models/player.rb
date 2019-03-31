class Player < ApplicationRecord
  belongs_to :team

  validates :player_id, uniqueness: true
  validates :name, uniqueness: true 
end
