require 'rails_helper'

RSpec.describe Player, type: :model do

  it "has attributes" do
    team = Team.create!(name: "A", email: "B", password: "C")
    player = team.players.create(
      name: "George Jetson",
      strength: 5,
      speed: 10,
      agility: 15,
      player_id: "AAAA24"
    )

    expect(player.name).to eq("George Jetson")
    expect(player.strength).to eq(5)
    expect(player.speed).to eq(10)
    expect(player.agility).to eq(15)
    expect(player.player_id).to eq("AAAA24")

    expect(player.team_id).to eq(team.id)
    expect(player.status).to eq("free")
    expect(player.on_team).to eq(false)
  end
end
