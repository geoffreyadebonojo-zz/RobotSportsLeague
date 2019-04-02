require 'rails_helper'

RSpec.describe "Team profile page" do

  before(:each) do
    visit registration_path

    fill_in '_registration_name', with: 'The A Team'
    fill_in '_registration_email', with: 'theteam@gmail'
    fill_in '_registration_password', with: 'AAA'
    fill_in '_registration_password_confirmation', with: 'AAA'

    click_on "Submit"

    expect(current_path).to eq(roster_path)
  end

  it "user can visit team profile page" do
    visit profile_path

    expect(current_path).to eq(profile_path)

    expect(page).to have_content("Name: The A Team")
    expect(page).to have_content("Email: theteam@gmail")
    expect(page).to have_content("Edit")
  end

  it "user can edit team profile" do
    visit profile_path

    expect(current_path).to eq(profile_path)

    click_on "Edit"

    expect(current_path).to eq("/profile/edit.1")
    expect(page).to have_content("Edit Team Info")

    fill_in "team[name]", with: "The B Team"

    click_on "Update Name"

    expect(current_path).to eq(profile_path)

    expect(page).to have_content("Name: The B Team")
  end

  it "alerts user if new name is already taken" do

    team = Team.create(
      name: "The C Team",
      email: "cteam@gmail",
      password: "cteamrules"
    )

    visit profile_path

    expect(current_path).to eq(profile_path)

    click_on "Edit"

    expect(current_path).to eq("/profile/edit.1")
    expect(page).to have_content("Edit Team Info")

    fill_in "team[name]", with: "The C Team"

    click_on "Update Name"

    expect(current_path).to eq("/teams/1")

    expect(page).to have_content("Name has already been taken")
  end

end
