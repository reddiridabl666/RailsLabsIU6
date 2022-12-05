require 'rails_helper'

RSpec.describe "user input", type: :system do
  it "returns valid answers" do
    visit root_path
    fill_in "input_1", with: 24
    fill_in "input_2", with: 36
    click_button "Calculate greatest common denominator"

    expect(page).to have_current_path root_path
    expect(find('#gcd')).to have_content '12'
    expect(find('#lcm')).to have_content '72'
  end

  it "returns valid answers" do
    visit root_path
    fill_in "input_1", with: -5
    fill_in "input_2", with: 36
    click_button "Calculate greatest common denominator"

    expect(page).to have_current_path root_path
    expect(page).to have_content "You should enter a natural number in each field"
  end
end