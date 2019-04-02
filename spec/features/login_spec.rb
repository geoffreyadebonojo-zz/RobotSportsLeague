require 'rails_helper'

RSpec.describe 'login process' do
  describe 'user can log in' do
    before(:each) do
      @name = "The A Team"
      @email = "aaa@gmail.com"
      @password = "tripleA#1"
      @password_confirmation = "tripleA#1"

      Team.create!(
        name: @name,
        email: @email,
        password: @password
      )
    end

    xit 'should succed' do
      visit login_path
      expect(current_path).to eq(login_path)

      fill_in 'email', with: @email
      fill_in 'password', with: @password

      click_on 'Log In'
      expect(current_path).to eq(roster_path)
    end

    it "should fail if password is incorrect" do
      visit login_path

      fill_in "email", with: @email
      fill_in "password", with: "incorrect"

      click_on "Log In"
      expect(current_path).to eq(login_path)
    end

    it "should fail if email is incorrect" do
      visit login_path

      fill_in "email", with: "wrong@email.com"
      fill_in "password", with: @password
      click_on "Log in"

      expect(current_path).to eq(login_path)
    end
  end
end
