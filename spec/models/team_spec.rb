require 'rails_helper'

RSpec.describe Team, type: :model do

  it "has attributes" do
    team = Team.create(name: "A", email: "B", password: "C")

    expect(team.name).to eq("A")
    expect(team.email).to eq("B")
  end
end
