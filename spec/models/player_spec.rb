require 'rails_helper'

RSpec.describe Player, type: :model do

  describe "validations" do
    it "has attributes" do
      team = Team.create!(name: "A", email: "B", password: "C")
      player = team.players.create(
        name: "George Jetson",
        speed: 10,
        strength: 5,
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

  describe "associations" do
    it "belongs_to team" do
      player = Player.reflect_on_association(:team)
      expect(player.macro).to eq(:belongs_to)
    end
  end

  describe "stats generation methods" do
    it ".stats_total" do
      team = Team.create!(name: "A", email: "B", password: "C")
      player = team.players.create(
        name: "George Jetson",
        speed: 35,
        strength: 45,
        agility: 30,
        player_id: "AAAA24"
      )

      expect(player.speed).to eq(25)
      expect(player.strength).to eq(35)
      expect(player.agility).to eq(20)
      expect(player.stats_total).to eq(80)
    end
  end

  describe "sort methods" do
    it "can sort roster by attributes" do
      team = Team.create!(name: "A", email: "B", password: "C")

      player_1 = team.players.first
      player_1.on_team = true
      player_1.status = "unassigned"
      player_1.name = "BBC"
      player_1.player_id = "AAAA01"
      player_1.strength = 10
      player_1.speed = 20
      player_1.agility = 20
      player_1.save

      player_2 = team.players.second
      player_2.on_team = true
      player_2.status = "unassigned"
      player_2.name = "ABB"
      player_2.player_id = "BAAA01"
      player_2.strength = 20
      player_2.speed = 35
      player_2.agility = 10
      player_2.save

      player_3 = team.players.third
      player_3.on_team = true
      player_3.status = "unassigned"
      player_3.name = "BAC"
      player_3.player_id = "AAAA02"
      player_3.strength = 30
      player_3.speed = 15
      player_3.agility = 25
      player_3.save

      roster = team.roster
      expect(roster.count).to eq(3)

      by_name = roster.sort_by_name
      expect(by_name).to eq([player_2, player_3, player_1])

      by_player_id = roster.sort_by_player_id
      expect(by_player_id).to eq([player_1, player_3, player_2])

      by_strength = roster.sort_by_strength
      expect(by_strength).to eq([player_3, player_2, player_1])

      by_speed = roster.sort_by_speed
      expect(by_speed).to eq([player_2, player_1, player_3])

      by_agility = roster.sort_by_agility
      expect(by_agility).to eq([player_3, player_1, player_2])
    end
  end
end
