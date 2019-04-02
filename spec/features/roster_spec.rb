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

  it "allows user to pick starters/alternates for roster" do

    visit pool_path

    click_link("Select Player", match: :first)

    visit roster_path

    expect(Team.first.roster.count).to eq(1)

    expect(page).to have_content("unassigned")
    expect(page).to_not have_content("starter")
    expect(page).to_not have_content("alternate")
    expect(page).to have_content("Starter")
    expect(page).to have_content("Alternate")

    click_link("Starter")

    expect(page).to_not have_content("unassigned")
    expect(page).to_not have_content("Starter")
    expect(page).to have_content("starter")
    expect(page).to have_content("Alternate")

    click_link("Alternate")

    expect(page).to_not have_content("unassigned")
    expect(page).to_not have_content("Alternate")
    expect(page).to have_content("alternate")
    expect(page).to have_content("Starter")
  end

end
