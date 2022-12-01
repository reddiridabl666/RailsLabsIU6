require 'rails_helper'

RSpec.describe "application", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "returns valid values after registration and login" do
    visit root_path
    click_link 'Sign Up'
    expect(page).to have_current_path new_user_path

    fill_in 'Username', with: 'test_user'
    fill_in 'Password', with: 'test_pwd'
    fill_in 'Password confirmation', with: 'test_pwd'
    click_button 'Create User'
    expect(page).to have_current_path root_path

    fill_in 'Username', with: 'test_user'
    fill_in 'Password', with: 'test_pwd'
    click_button 'Login'
    expect(page).to have_current_path input_path

    fill_in "input_1", with: 24
    fill_in "input_2", with: 36
    click_button "Calculate greatest common denominator"

    expect(find('#gcd')).to have_content '12'
    expect(find('#lcm')).to have_content '72'
  end

  it "doesn't allow non-logged in users to calculate values" do
    visit input_path
    expect(page).to have_current_path root_path
  end
end