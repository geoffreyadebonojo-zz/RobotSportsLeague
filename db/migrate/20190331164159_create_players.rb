class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :team, foreign_key: true
      t.integer :status, default: 0
      t.integer :player_id
      t.string :name
      t.integer :speed
      t.integer :strength
      t.integer :agility
      t.boolean :on_team, default: false

      t.timestamps
    end
  end
end
