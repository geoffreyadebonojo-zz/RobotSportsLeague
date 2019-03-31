class Player < ApplicationRecord
  belongs_to :team

  enum status: %w(none alternate starter)
end
