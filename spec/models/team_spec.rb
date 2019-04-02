require 'rails_helper'

RSpec.describe Team, type: :model do

  it "has attributes" do
    team = Team.create(name: "A", email: "B", password: "C")

    expect(team.name).to eq("A")
    expect(team.email).to eq("B")
  end

  describe "associations" do
    it "has_many players" do
      team = Team.reflect_on_association(:players)
      expect(team.macro).to eq(:has_many)
    end
  end

  describe "methods" do

    before(:each) do
      @team = Team.create(name: "A", email: "B", password: "C")
      @player_1 = @team.players.first
      @player_1.on_team = true
      @player_1.status = "unassigned"
      @player_1.save

      @player_2 = @team.players.second
      @player_2.on_team = true
      @player_2.status = "starter"
      @player_2.save

      @player_3 = @team.players.third
      @player_3.on_team = true
      @player_3.status = "alternate"
      @player_3.save

      @player_4 = @team.players.fourth
      @player_4.on_team = true
      @player_4.status = "free"
      @player_4.save
    end


    it ".roster" do
      expect(@team.roster.count).to eq(4)
    end

    it ".unassigned" do
      expect(@team.unassigned.count).to eq(1)
      expect(@team.unassigned.first.name).to eq(@player_1.name)
    end

    it ".starters" do
      expect(@team.starters.count).to eq(1)
      expect(@team.starters.first.name).to eq(@player_2.name)
    end

    it ".alternates" do
      expect(@team.alternates.count).to eq(1)
      expect(@team.alternates.first.name).to eq(@player_3.name)
    end

    it ".free_agents" do
      expect(@team.free_agents.count).to eq(97)
    end
  end
end
