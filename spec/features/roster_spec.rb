require 'rails_helper'

RSpec.describe "Roster Page" do

  before(:each) do
    visit registration_path

    fill_in '_registration_name', with: 'The A Team'
    fill_in '_registration_email', with: 'theteam@gmail'
    fill_in '_registration_password', with: 'AAA'
    fill_in '_registration_password_confirmation', with: 'AAA'

    click_on "Submit"

    expect(current_path).to eq(roster_path)
  end

  it "allows auto-generation of roster" do
    expect(Team.first.roster.count).to eq(0)

    click_on "Auto Select"

    expect(Team.first.roster.count).to eq(15)
  end

  it "allows user to clear roster" do
    expect(Team.first.roster.count).to eq(0)

    click_on "Auto Select"

    expect(Team.first.roster.count).to eq(15)

    click_on "Clear Roster"

    expect(Team.first.roster.count).to eq(0)
  end

  it "allows user to pick starters/alternates for roster" do

    visit pool_path
    expect(page).to have_content("Remaining Slots: 15")
    expect(page).to have_content("Available Players: 100")

    click_link("Select Player", match: :first)

    visit roster_path
    expect(current_path).to eq(roster_path)

    expect(Team.first.roster.count).to eq(1)

    expect(page).to have_content("Starter Slots Remaining: 10")
    expect(page).to have_content("Alternate Slots Remaining: 5")
    expect(page).to have_content("unassigned")
    expect(page).to_not have_content("starter")
    expect(page).to_not have_content("alternate")
    expect(page).to have_content("Switch to Starter")
    expect(page).to have_content("Switch to Alternate")

    click_link("Switch to Starter")

    expect(page).to have_content("Starter Slots Remaining: 9")
    expect(page).to have_content("Alternate Slots Remaining: 5")
    expect(page).to_not have_content("unassigned")
    expect(page).to_not have_content("Swith to Starter")
    expect(page).to have_content("starter")
    expect(page).to have_content("Switch to Alternate")
    expect(page).to have_content("Unassign Player")

    click_link("Switch to Alternate")

    expect(page).to have_content("Starter Slots Remaining: 10")
    expect(page).to have_content("Alternate Slots Remaining: 4")
    expect(page).to_not have_content("unassigned")
    expect(page).to_not have_content("Switch to Alternate")
    expect(page).to have_content("alternate")
    expect(page).to have_content("Switch to Starter")
    expect(page).to have_content("Unassign Player")

    click_link("Unassign Player")

    expect(page).to have_content("Starter Slots Remaining: 10")
    expect(page).to have_content("Alternate Slots Remaining: 5")
    expect(page).to have_content("unassigned")
    expect(page).to have_content("Switch to Starter")
    expect(page).to have_content("Switch to Alternate")
    expect(page).to_not have_content("alternate")
    expect(page).to_not have_content("starter")
    expect(page).to_not have_content("Unassign Player")
  end

  xit "allows user to sort roster by player attributes" do
    visit roster_path
    expect(Team.first.roster.count).to eq(0)

    click_on "Auto Select"
    expect(Team.first.roster.count).to eq(15)

    click_on "Name"
    expect(current_path).to eq(roster_path({sort: "name"}))

    click_on "Player ID"
    expect(current_path).to eq(roster_path({sort: "player_id"}))

    click_on "Speed"
    expect(current_path).to eq(roster_path({sort: "speed"}))

    click_on "Strength"
    expect(current_path).to eq(roster_path({sort: "strength"}))

    click_on "Agility"
    expect(current_path).to eq(roster_path({sort: "agility"}))

    click_on "Stats Total"
    expect(current_path).to eq(roster_path({sort: "stats_total"}))
  end
end
