require 'rails_helper'

describe 'user visits registration page' do
  describe 'user fills out registration' do
    it 'logs the new user in' do
      visit registration_path

      expect(current_path).to eq(registration_path)

      fill_in '_registration_name', with: 'ATeam'
      fill_in '_registration_email', with: 'theteam@gmail'
      fill_in '_registration_password', with: 'AAA'
      fill_in '_registration_password_confirmation', with: 'AAA'

      click_on 'Submit'
      expect(current_path).to eq(roster_path)
    end

    it 'doesnt create a team if email is taken' do
      Team.create!(
        name: "The A Team",
        email: "aaa@gmail",
        password: "TripleA#1"
      )

      visit registration_path

      fill_in "_registration_name", with: "The B Team"
      fill_in "_registration_email", with: "aaa@gmail"
      fill_in "_registration_password", with: "BBB"
      fill_in "_registration_password_confirmation", with: "BBB"

      click_on "Submit"

      expect(current_path).to eq(registration_path)
      expect(page).to have_content('Email has already been taken')
    end

    it 'doesnt create a team if name is taken' do
      Team.create!(
        name: "The A Team",
        email: "aaa@gmail",
        password: "TripleA#1"
      )

      visit registration_path

      fill_in "_registration_name", with: "The A Team"
      fill_in "_registration_email", with: "bbb@gmail"
      fill_in "_registration_password", with: "BBB"
      fill_in "_registration_password_confirmation", with: "BBB"

      click_on "Submit"

      expect(current_path).to eq(registration_path)
      expect(page).to have_content('Name has already been taken')
    end
  end
end
