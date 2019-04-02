require 'rails_helper'

RSpec.describe "Pool of Players Page" do

  before(:each) do
    visit registration_path

    fill_in '_registration_name', with: 'The A Team'
    fill_in '_registration_email', with: 'theteam@gmail'
    fill_in '_registration_password', with: 'AAA'
    fill_in '_registration_password_confirmation', with: 'AAA'

    click_on "Submit"

    expect(current_path).to eq(roster_path)

  end

  it "displays pool of players" do
    visit pool_path

    expect(page).to have_content("Pool o' Players")
    expect(page).to have_content("Players on Team: 0")
    expect(page).to have_content("Available Players: 100")
    expect(page).to have_content("Name")
    expect(page).to have_content("ID")
    expect(page).to have_content("Speed")
    expect(page).to have_content("Strength")
    expect(page).to have_content("Agility")
    expect(page).to have_content("Total")
    expect(page).to have_content("Status")

    expect(Team.first.players.count).to eq(100)
  end

  it "allows user to select/unselect a player" do
    visit pool_path

    click_link("Select Player", match: :first)
    click_on("Unselect Player")

    expect(page).to_not have_content("Unselect Player")
  end

end
