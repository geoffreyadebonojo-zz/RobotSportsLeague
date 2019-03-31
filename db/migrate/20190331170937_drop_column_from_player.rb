class DropColumnFromPlayer < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :player_id
  end
end
