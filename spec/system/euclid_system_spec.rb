require 'rails_helper'

RSpec.describe "user input", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "returns valid answers" do
    visit root_path
    fill_in "input_1", with: 24
    fill_in "input_2", with: 36
    click_button "Calculate greatest common denominator"

    expect(find('#gcd')).to have_content '12'
    expect(find('#lcm')).to have_content '72'
  end
end