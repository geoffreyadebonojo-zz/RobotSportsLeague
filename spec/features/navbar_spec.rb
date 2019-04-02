require 'rails_helper'

describe 'Navbar' do
  describe 'links go to appropriate pages' do
    it 'unregistered user has access to login and registration' do
      visit home_path

      click_link 'Log in'
      expect(current_path).to eq(login_path)

      click_link 'Register'
      expect(current_path).to eq(registration_path)
    end

    it 'registered user has access to pages through links' do
      visit registration_path

      fill_in '_registration_name', with: 'The A Team'
      fill_in '_registration_email', with: 'theteam@gmail'
      fill_in '_registration_password', with: 'AAA'
      fill_in '_registration_password_confirmation', with: 'AAA'

      click_on "Submit"

      visit home_path

      click_on "View Available Players"
      expect(current_path).to eq(pool_path)

      click_on "View Roster"
      expect(current_path).to eq(roster_path)

      click_on "View Available Players"
      expect(current_path).to eq(pool_path)

      click_on "Team Profile"
      expect(current_path).to eq(profile_path)

      click_on "Log out"
      expect(current_path).to eq(home_path)
    end
  end
end
