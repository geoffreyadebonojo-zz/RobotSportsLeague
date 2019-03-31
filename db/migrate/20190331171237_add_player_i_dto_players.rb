class AddPlayerIDtoPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :player_id, :string
  end
end
