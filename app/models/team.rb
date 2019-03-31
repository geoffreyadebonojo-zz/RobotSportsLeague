class Team < ApplicationRecord
  has_secure_password

  has_many :players
end
